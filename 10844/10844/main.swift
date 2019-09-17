
import Foundation

let input: Int = Int(readLine()!)!
let divider: Int = 1000000000
var array:[[Int]] = []
var n: [Int] = []

for j in 1 ... 9 {
    for i in 1 ... 9 {
        n.append(i)
    }
    array.append(n)
}

print(array)
