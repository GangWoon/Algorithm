
import Foundation

let count = Int(readLine()!)!
var answer = 0


func abc(_ n: Int) -> Int {
    var a = 4
    var b = 2
    var c = 1
    
    if n < 4 {
        switch n {
        case 1:
            return 1
        case 2:
            return 2
        case 3:
            return 4
        default:
            let b = 12
        }
    }
    
    (4 ... n).forEach { _ in
        (a, b , c) = (a + b + c, a , b)
    }
    return a
}

if count < 11 {
    for _ in 0 ..< count {
        let input = Int(readLine()!)!
        print(abc(input))
    }
}
