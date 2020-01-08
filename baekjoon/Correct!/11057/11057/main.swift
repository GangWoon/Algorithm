
let input: Int = Int(readLine()!)!
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: input)
var summary: Int = 0
let divider: Int = 10007

for i in 0 ... 9 {
    array[0][i] = 1
}

if input > 1 {
    for i in 1 ... input - 1{
        for j in 0 ... 9 {
            for k in 0 ... j {
                array[i][j] += (array[i - 1][k] % divider)
            }
        }
    }
}

for i in 0 ... 9 {
    summary += array[input - 1][i]
}

print(summary % divider)
