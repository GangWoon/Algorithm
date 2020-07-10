

import Foundation

func solution(_ timeStep: [Int], _ top: [Int]) -> Int {
    var temp = timeStep.reversed() as [Int]
    for item in top {
        var deleteCount = 0
        for (index, comparedTo) in temp.enumerated() {
            guard deleteCount != 5 else { continue }
            if item >= comparedTo {
                temp.remove(at: index - deleteCount)
                deleteCount += 1
            }
        }
    }
    return timeStep.count - temp.count
}

let tiemStep = [ 44, 18, 29, 43, 2, 30, 37, 29, 55, 4, 28, 34,
    4, 57, 33, 20, 15, 43, 58, 5, 31, 17, 55, 2, 27 ]
let top = [ 44, 7, 21, 20, 34 ]

solution(tiemStep, top)


