// Reference ID: woongs

if let input = readLine() {
    let n: Int = Int(input) ?? 0
    let valueArray: [Int] = readLine()?.split(separator: " ").map { Int($0) ?? 0 } ?? []
    var dpDown: [Int] = Array(repeating: 1, count: n)
    var dpUp: [Int] = Array(repeating: 1, count: n)
    var dp: [Int] = Array(repeating: 0, count: n)
    
    if n > 1 {
        for i in 1 ..< n {
            for j in 0 ..< i {
                if valueArray[i] > valueArray[j] && dpDown[i] < dpDown[j] + 1 {
                    dpDown[i] = dpDown[i] + 1
                }
            }
        }
        
        for i in 2 ..< n {
            for j in 1 ..< i {
                if valueArray[n - i] > valueArray[n - j] && dpUp[n - i] < dpUp[n - j] + 1 {
                    dpUp[n - i] = dpUp[n - j] + 1
                }
            }
        }
    }
    
    for i in 0 ..< n {
        dp[i] = dpUp[i] + dpDown[i] - 1
    }
    print(dp.max() ?? 1)
}
