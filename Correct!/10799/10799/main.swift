
import Foundation

let input = readLine()!
var stack = [Character]()
var cnt = 0
var temp: Character = "("
for str in input {
    if str == "(" {
        stack.append(str)
    } else {
        if temp == ")" {
            cnt += 1
            stack.popLast()
        } else {
            stack.popLast()
            cnt += stack.count
        }
    }
    temp = str
}
print(cnt)
