import Foundation

class Document: Equatable {
    
    // MARK: - Properties
    let index: Int
    var priority: Int
    var previous: Document?
    var next: Document?
    
    // MARK: - Lifecycle
    init(_ index: Int, _ priority: Int) {
        self.index = index
        self.priority = priority
    }
    
    // MARK: - Method
    func delete() {
        previous?.next = next
        next?.previous = previous
        priority = 0
        previous = nil
        next = nil
    }
    
    static func == (lhs: Document, rhs: Document) -> Bool {
        return lhs.index == rhs.index && lhs.priority == rhs.priority
    }
}

func makeLinkedList(_ array: [Document]) {
    for item in array {
        item.previous = item == array.first ? array.last : array[item.index - 1]
        item.next = item == array.last ? array.first : array[item.index + 1]
    }
}

func findMax(_ current: Document?, _ max: Int) -> (hasMax: Bool, document: Document?) {
    var copied = current
    while true {
        if copied?.priority == max {
            return (true, copied)
        }
        else if copied?.next == current {
            return (false, current)
        }
        copied = copied?.next
    }
}

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var result = 0
    var max = priorities
        .sorted { $0 > $1 }.first ?? 0
    let array = priorities.enumerated()
        .map { Document($0.offset, $0.element) }
    var current = array.first
    makeLinkedList(array)
    while true {
        let value = findMax(current, max)
        guard value.hasMax else {
            max -= 1
            continue
        }
        current = value.document
        result += 1
        if location == current?.index { break }
        current = current?.next
        current?.previous?.delete()
        
    }
    
    return result
}

solution([1, 1, 9, 1, 1, 1], 0)
