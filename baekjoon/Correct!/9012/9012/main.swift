import Foundation


let inputCount: String = readLine()!
var tries: Int = Int(inputCount)!

func abc(str: String) -> String {
    var cnt: Int = 0
    for a in str {
        if a == "(" {
            cnt += 1
        }
        else if a == ")" {
            cnt -= 1
        }
        if cnt < 0 {
            return "NO"
        }
    }
    if cnt == 0 {
        return "YES"
    } else {
        return "NO"
    }
}

while tries > 0 {
    let aa = readLine()!
    print(abc(str: aa))
    tries -= 1
}
