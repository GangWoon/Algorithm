

let length = Int(readLine()!)!
let value = readLine()!.split(separator: " ")

var array: [Int] = Array(repeating: 0, count: length)
var valueArray: [Int] = []
var maximum: Int = 0

for i in value {
    let value = Int(i)!
    valueArray.append(value)
}

for i in 0 ..< length {
    for j in 0 ..< i {
        if valueArray[i] > valueArray[j] {
            maximum = max(maximum, array[j])
        }
    }
    array[i] = maximum + valueArray[i]
    maximum = 0
}

for i in array {
    maximum = max(maximum, i)
}

print(maximum)
