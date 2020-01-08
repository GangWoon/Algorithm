
import Foundation

let input = readLine()!.components(separatedBy: " ")
let person = Int(input.first!)!
let cut = Int(input.last!)!
var queue: ArraySlice<Int> = []
var answer: [String] = []
var answers: String = ""
var cnt = 0

for i in 1 ... person {
    queue.append(i)
}

while queue.isEmpty == false {
    for i in 0 ..< cut {
        if i + 1 == cut {
            let a = String(queue.first!)
            queue = queue.dropFirst()
            answer.append(a)
        } else {
            let a = queue.first!
            queue = queue.dropFirst()
            queue.append(a)
        }
    }
}

for a in answer {
    cnt += 1
    if answers.isEmpty {
        answers += "<"
    }

    if person == cnt {
        answers.append(a)
        answers.append(">")
    } else {
       
        let b = String(a) + ", "
        answers.append(b)
        
    }
}
print(answers)

