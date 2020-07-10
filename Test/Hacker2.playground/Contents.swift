import Foundation

struct Number {
    var value: Int
    var index: Int
}

func solution(input: [Int], count: Int) -> [Int] {
    var result: [Int] = []
    let numbers = input.enumerated().map { Number(value: $0.element, index: $0.offset) }
    
    guard var min = numbers.first else { return result }
    for (index, item) in input.enumerated() {
        guard index != count - 1 else { break }
        if min.value > item { min = Number(value: item, index: index) }
    }
    result.append(min.value)
    
    for (index, _) in input.enumerated() {
        guard let lastIndex = input.index(index,
                                          offsetBy: count - 1,
                                          limitedBy: input.endIndex - 1) else { break }
        if min.index < index {
            let tempMin = (index...lastIndex)
                .map { tempIndex -> (index: Int, value: Int) in
                    return (tempIndex, input[tempIndex])
                }
                .sorted{ $0.value < $1.value }
                .first!
            min = Number(value: tempMin.value, index: tempMin.index)
            result.append(min.value)
        }
        
        if min.value > input[lastIndex] {
            min = Number(value: input[lastIndex], index: lastIndex)
            result.append(min.value)
        }
    }
    
    return result
}


solution(input: [2,5,4,6,8, 1], count: 3)



