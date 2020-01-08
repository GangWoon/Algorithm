
import Foundation

let input: Int = Int(readLine()!)!

func solution(_ n: Int) -> Int {
    var x = 1
    var y = 1
    
    guard n > 1 else { return 1 }
    
    (2 ... n).forEach { _ in
        (x, y) = ((x + (2 * y)) % 10007, x % 10007)
    }
    return x
}

print(solution(input))
