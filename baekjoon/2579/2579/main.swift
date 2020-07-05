import Foundation

func solution(_ name_list: [String]) -> Bool {
    var result: Bool = false
    
    for (index, item) in name_list.enumerated() {
        let temp = (index, item)
        
        for (secondIndex, secondItem) in name_list.enumerated() {
            let secondTemp = (secondIndex, secondItem)
            if temp == secondTemp {
                continue
            }
            if secondItem.contains(temp.1) {
                result = true
            }
        }
    }

    
    return result
}


print(solution(["봄","여울","봄봄"]))

