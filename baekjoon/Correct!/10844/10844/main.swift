
let input = Int(readLine()!)!
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: input)
let divider = 1000000000
var summery = 0

for i in 1 ... 9 {
    array[0][i] = 1
}

if input > 1 {
    for i in 1 ... input - 1 {
        array[i][0] = array[i - 1][1]
        for j in 1 ... 8 {
            array[i][j] = (array[i - 1][j - 1] + array[i - 1][j + 1]) % divider
        }
        array[i][9] = array[i - 1][8]
    }
}

for i in 0 ... 9 {
    summery += array[input - 1][i]
}

print(summery % divider)

