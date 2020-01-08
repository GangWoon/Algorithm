

func solution(participant: [String], completion: [String]) -> String {
    var dictionary =  [String : Int]()
    participant.forEach {
        if dictionary[$0] != nil {
            dictionary[$0]! += 1
        } else {
            dictionary.updateValue(1, forKey: $0) }
        }

    completion.forEach {
        if dictionary[$0] != nil {
            dictionary[$0]! -= 1
        }
    }
    return dictionary.filter { $0.value > 0 }.keys.first!
}

