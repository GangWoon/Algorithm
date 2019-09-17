
import Foundation

let input = Int(readLine()!)!

func a(_ n: Int) -> Int {
    var x = 1
    var y = 1

    guard n > 2 else { return 1 }
    
    (3 ... n).forEach { _ in
        (x, y) = (x + y, x)
    }
    return x
}


print(a(input))
