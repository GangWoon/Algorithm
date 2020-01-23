

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var cycleNumber: Int = n
        var dictionary: [Int : Int] = [ : ]
        var cycleDictionary: [Int : Bool] = [ : ]
        
        while true {
            let sum: Int = String(cycleNumber).map {
                let factor: Int = Int(String($0))!
                cycleNumber = factor
                if dictionary[factor] == nil {
                    dictionary.updateValue(factor * factor, forKey: factor)
                }
                return factor
            }.reduce(0) { $0 + dictionary[$1]! }
            
            if cycleDictionary[sum] == true {
                return false
            }
            cycleDictionary.updateValue(true, forKey: sum)

            if sum == 1 {
                return true
            }
            cycleNumber = sum
        }
    }
}



