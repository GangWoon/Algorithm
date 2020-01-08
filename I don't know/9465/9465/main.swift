
func max (_ a: Int, _ b: Int) -> Int {
    return a > b ? a : b
}

if let testCase = readLine() {
    let t = Int(testCase) ?? 0
    
    for _ in 0..<t {
        if let input = readLine() {
            let n = Int(input) ?? 0
            
            var dpA: [Int] = [Int](repeating: 0, count: n+2)
            var dpB: [Int] = [Int](repeating: 0, count: n+2)
            
            let a = readLine()!.split(separator: " ")
            let b = readLine()!.split(separator: " ")
            
            
            
            for i in 2..<n+2 {
                dpA[i] = max(
                    max(dpA[i-1], dpB[i-1] + Int(a[i-2])!),
                    dpB[i-2] + Int(a[i-2])!
                )
                dpB[i] = max(
                    max(dpB[i-1], dpA[i-1] + Int(b[i-2])!)
                    , dpA[i-2] + Int(b[i-2])!)
            }
            
            if dpA[n+1] > dpB[n+1] {
                print(dpA[n+1])
            } else {
                print(dpB[n+1])
            }
        }
    }
}


let input: Int = Int(readLine()!)!
var arrray: [[Int]] = []
var line: [Int] = []



let firstLine = readLine()?.split(separator: " ")
for number in firstLine! {
    line.append(Int(number)!)
}
arrray.append(line)

line = []
let secondLine = readLine()?.split(separator: " ")
for number in secondLine! {
    line.append(Int(number)!)
}
arrray.append(line)

for i in 0 ..< input {
    arrray[0][i] = max(arrray[0][i - 1], arrray[1][i - 1])
    arrray[1][i] = arrray[1][i]
    print(arrray[0][i])
}

