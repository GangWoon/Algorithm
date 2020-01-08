

let length = Int(readLine()!)!
let value = readLine()!.split(separator: " ")

var array: [Int] = Array(repeating: 1, count: length)
var valueArray: [Int] = []
var maximum: Int = 0
var b: [Int] = []

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
    array[i] = maximum + 1
    maximum = 0
}

//for i in valueArray.reversed(){
//    for j in i - 1 ... 0 {
//        if valueArray[i] < valueArray[j] {
//            maximum = max(maximum, array[j])
//        }
//    }
//    b[i] = maximum + 1
//    maximum = 0
//}

for i in array {
    maximum = max(maximum, i)
}

for i in valueArray.reversed() {
    b.append(i)
}
print(maximum)
print(array)
print(b)
