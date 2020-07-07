
// 위장
// 모자 2개, 옷 3개 입을 수 있는 가지수는 모자(3개 x썼을때도 포함) 옷(4개 x썼을때도 포함) 모든 걸 안 입는 경우 한가지를 제외한다.

import Foundation

func createDictionary(_ clothes: [[String]]) -> [String: Int] {
    var dictionary: [String: Int] = [: ]
    for cloth in clothes {
        let value = (dictionary[cloth[1]] ?? 1) + 1
        dictionary
            .updateValue(value,
                         forKey: cloth[1])
    }
    
    return dictionary
}

func solution(_ clothes:[[String]]) -> Int {
    let dictionary = createDictionary(clothes)
    let result = dictionary
        .reduce(1) { $0 * $1.value } - 1
    
    return result
}

solution([["crow_mask", "face"],
          ["blue_sunglasses", "face"],
          ["smoky_makeup", "face"]])
