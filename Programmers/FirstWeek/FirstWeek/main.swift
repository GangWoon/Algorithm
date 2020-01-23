

func solution(participant: [String], completion: [String]) -> String {
    
    var a = zip(participant, Array(repeating: 1, count: participant.count))
    var b = Dictionary().merging(a) { (first, second) in
        first + second
    }
    
    print(b.filter { $0.value > 0 }.keys)
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

solution(participant: ["a","b","c","a"], completion: ["a","b","c"])
