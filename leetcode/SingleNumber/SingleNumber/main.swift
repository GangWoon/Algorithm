

import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var comparedNumber: Set<Int> = []
        var set: Set<Int> = []
        nums.forEach {
            comparedNumber.contains($0) ? set.insert($0) : comparedNumber.insert($0)
        }
        return comparedNumber.subtracting(set).first!
    }
}
