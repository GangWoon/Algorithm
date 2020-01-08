

let length = Int(readLine()!)!
let value = readLine()!.split(separator: " ")

var array: [Int] = Array(repeating: 1, count: length)
var valueArray: [Int] = []
var front: Int = 0
var back: Int = 0

for i in value {
    let value = Int(i)!
    valueArray.append(value)
}

for i in 0 ..< length {
    for j in 0 ..< i {
        if valueArray[i] > valueArray[j] {
            front = max(front, array[j])
        }
        
    }
    array[i] = front + 1
    front = 0
}

for i in array {
    front = max(front, i)
}

print(front)
