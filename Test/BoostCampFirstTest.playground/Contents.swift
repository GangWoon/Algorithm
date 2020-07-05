import Foundation

func removeDuplicates(_ array: [Int]) -> [Int] {
    var result: [Int] = []
    for (index, item) in array.enumerated() {
        if array.firstIndex(of: item) == index {
            result.append(item)
        }
    }
    
    return result
}

func updateSum(a arrayA: [Int], b arrayB: [Int]) -> Int {
    var result: [Int] = []
    result.append(contentsOf: arrayA)
    result.append(contentsOf: arrayB)
    
    return removeDuplicates(result).count
}

func updateComplement(a arrayA: [Int], b arrayB: [Int]) -> Int {
    var result = arrayA
    var delete = 0
    for (index, item) in result.enumerated() {
        arrayB.forEach { compared in
            if item == compared {
                let realIndex = index - delete
                result.remove(at: realIndex)
                delete += 1
            }
        }
    }
    
    return result.count
}

func updateIntersect(a arrayA: [Int], b arrayB: [Int]) -> Int {
    var result: [Int] = []
    arrayA.forEach { item in
        arrayB.forEach { compared in
            item == compared ? result.append(item) : nil
        }
    }
    
    return result.count
}

func solution(_ arrayA:[Int], _ arrayB: [Int]) -> [Int] {
    var result: [Int] = []
    let setA = removeDuplicates(arrayA)
    let setB = removeDuplicates(arrayB)
    result.append(setA.count)
    result.append(setB.count)
    result.append(updateSum(a: setA, b: setB))
    result.append(updateComplement(a: setA, b: setB))
    result.append(updateIntersect(a: setA, b: setB))
    
    return result
}

print(solution([2,3,4,3,5], [1,6,7]))
