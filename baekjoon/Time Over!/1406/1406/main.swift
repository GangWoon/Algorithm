
import Foundation

var leftStack: [Character] = []
var rightStack: ArraySlice<Character> = []
let input: String = readLine()!
var s = ""

for str in input {
    leftStack.append(str)
}

var tries = Int(readLine()!)!
while tries > 0 {
    let orders = readLine()!.components(separatedBy: " ")
    if orders.count == 2 {
        let second = orders.last!
        for a in second {
            leftStack.append(a)
        }
    } else {
        let order = orders.first!
        if order == "L" {
                if let thing = leftStack.popLast() {
                    rightStack.append(thing)
                }
        } else if order == "D" {
            if rightStack.isEmpty == true {
            } else {
                let thing = rightStack.first!
                rightStack = rightStack.dropFirst()
                leftStack.append(thing)
            }
        } else if order == "B" {
            if leftStack.isEmpty {
            }
            leftStack.popLast()
        }
    }
    tries -= 1
}

for a in leftStack {
    s.append(a)
}

for i in 0 ..< rightStack.count {
    let a = rightStack.popLast()!
    s.append(a)
}

print(s)
