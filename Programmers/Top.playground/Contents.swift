
// 탑
// 거꾸로 배열에 접근하는 부분을 생가하지 못해서 고생함.

import Foundation

func reverse(_ size: Int, index: Int) -> Int {
    return size - index
}

func failedToSignal(_ index: Int, size: Int) -> Bool {
    return index + 1 != size
}

func solution(_ heights:[Int]) -> [Int] {
    var result: [Int] = []
    for (index, item) in heights.reversed().enumerated() {
        for (comparToIndex, comparToItem) in heights.reversed().enumerated() {
            if index == comparToIndex || index > comparToIndex { continue }
            if item < comparToItem {
                result.append(reverse(heights.count, index: comparToIndex))
                break
            }
        }
        failedToSignal(index, size: result.count) ? result.append(.zero) : nil
    }
    
    return result.reversed() as [Int]
}

solution([6, 9, 5, 7, 4])

