
// Network
// find 함수는 부모 노드를 찾는 재귀 함수이며, union 함수는 computers[i][j] 값이 1일 경우에 rank 값이 더 높은 쪽으로 합쳐주는 함수이다.

import Foundation

func find(_ root: inout [Int], _ node: Int) -> Int {
    if root[node] == node {
        return node
    } else {
        root[node] = find(&root,
                          root[node])
        return root[node]
    }
}

func union(_ root: inout [Int], _ rank: inout [Int] , _ x: Int, _ y: Int) {
    let x = find(&root,
                 x)
    let y = find(&root,
                 y)
    
    guard x != y else { return }
    if rank[x] < rank[y] {
        root[x] = y
        rank[y] += 1
    } else {
        root[y] = x
        rank[x] += 1
    }
}

func configure(_ index: Int) -> (root: [Int], rank: [Int]) {
    var root: [Int] = []
    var rank: [Int] = []
    
    for item in 0..<index {
        root.append(item)
        rank.append(0)
    }
    
    return (root, rank)
}

func makeNetwork(_ root: inout [Int], _ rank: inout [Int], _ computers: [[Int]],  count: Int) {
    for first in 0..<count {
        for second in 0..<first {
            computers[first][second] == 1 ? union(&root,
                                                  &rank,
                                                  first,
                                                  second) : nil
        }
    }
}

func numberOfNetworks(_ root: inout [Int], count: Int) -> Int {
    var networks: Set<Int> = .init()
    
    for index in 0..<count {
        root[index] = find(&root,
                           index)
        networks.insert(root[index])
    }
    
    return networks.count
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var values = configure(n)
    makeNetwork(&values.root,
                &values.rank,
                computers,
                count: n)
    
    return numberOfNetworks(&values.root,
                            count: n)
}

solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
