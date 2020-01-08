import Foundation

let input: Int = Int(readLine()!)!
var count: [Int] = Array(repeating: 0, count: input + 1)

if input != 1 {
    for i in 2 ... input {
        
        count[i] = count[i - 1] + 1
        if i % 2 == 0 && count[i] > count[i / 2] + 1 {
            count[i] = count[i / 2] + 1
        }
        if i % 3 == 0 && count[i] > count[i / 3] + 1 {
            count[i] = count[i / 3] + 1
        }
    }
}
print(count[input])
