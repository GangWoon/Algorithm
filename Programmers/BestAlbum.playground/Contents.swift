
// 베스트 앨범
// 마지막 부분에서 배열에 길이가 2이상일때만 2개의 속성을 사용할 수 있도록 구현하고 싶었는데 어떻게 접근해야할지 모르겠다.

import Foundation

func createInformationDictionary(_ genres:[String], _ plays:[Int]) -> [Int: (genere: String, plays: Int)] {
    var result: [Int: (genere: String, plays: Int)] = [: ]
    for index in 0..<genres.count {
        result
            .updateValue((genres[index], plays[index]),
                         forKey: index)
    }
    
    return result
}

func createRankDictioanry(_ dictionary: [Int: (genere: String, plays: Int)]) -> [String: Int]{
    var result: [String: Int] = [: ]
    dictionary.forEach {
        let value = (result[$0.value.genere] ?? 0) + $0.value.plays
        result.updateValue(value, forKey: $0.value.genere)
    }
    
    return result
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    let dictionary = createInformationDictionary(genres, plays)
    let rank = createRankDictioanry(dictionary)
    var result: [Int] = []
    rank
        .sorted { $0.value > $1.value }
        .map { song in
            return dictionary
                .filter { $0.value.genere == song.key }
            }
        .map{ item in
            item
                .sorted { (first, second) -> Bool in
                    if first.value.plays > second.value.plays { return true }
                    else if first.value.plays == second.value.plays {
                        return first.key < second.key
                    } else { return false }
                }
            }
        .forEach {
            if $0.count >= 2{
                result.append($0[0].key)
                result.append($0[1].key)
            } else {
                result.append($0[0].key)
            }
        }
    
    return result
}


print(solution(["classic", "pop", "classic", "classic", "pop"],
               [500, 600, 150, 800, 2500]))
