import Foundation

var result = 0

func recursive(_ input: [Int], _ target: Int, sum: Int) {
    guard let fisrt = input.first else {
        sum == target ? result += 1 : nil
        
        return
    }
    
    recursive(Array(input[1..<input.count]), target, sum: sum + fisrt)
    recursive(Array(input[1..<input.count]), target, sum: sum - fisrt)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    recursive(numbers, target, sum: 0)
    
    return result
}

solution([1,1,1,1,1], 3)

