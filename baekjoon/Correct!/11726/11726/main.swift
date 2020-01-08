
import Foundation

let input = Int(readLine()!)!

func fibonacci(_ n: Int) -> Int {
    var a = 1
    var b = 1
    guard n > 1 else { return a }
    
    (2...n).forEach { _ in
        (a, b) = ((a + b) % 10007 , a % 10007)
    }
    return a
}

print(fibonacci(input))
