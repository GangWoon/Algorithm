import Foundation

/// A.count + 1 만큼 피보나치 수를 생성하기. 가장 좋은 케이스는 한번에 도달 하는 경우이기 때문. -1-> N
///
/// 1. 위치가 명확히 정의된 그래프 탐색 문제와 동일
/// 2. 그래프의 가중치가 없음
/// 위 특징을 기반으로 BFS를 사용하게 됨.
///
/// BFS(Breadth-First Search)의 경우 가중치가 동일한 그래프에서 최단 경로를 보장해준다.
/// 현재 위치에서 점프할 수 있는 모든 위치를 탐색한 뒤 다음 위치로 넘어간다.
/// 방문한 위치의 경우, 다시 탐색하지 않기 때문에 중복 탐색을 제거할 수 있다.
///
public func FibFrogsolution2(_ A: inout [Int]) -> Int {
  let N = A.count
  let fibonacci = generateFibonacci(upTo: N + 1)
  
  if N == 0 {
    return 1
  }
  if fibonacci.contains(N + 1) {
    return 1
  }
  
  var queue: [(position: Int, jumps: Int)] = [(-1, 0)]
  /// [Bool]을 사용할 경우, 공간 복잡도에서 문제가 발생할 수 있음. 이 문제에서 필요한 건 결국 방문했던 index의 위치.
  /// 이걸 표현하기 위한 적합한 데이터 구조는 Set임. key로 접근해서 포함됐는지 판별할 수 있기 때문에 O(1)의 시간이 소모됨.
  /// 뿐만 아니라 A.count만큼의 공간도 필요하지 않게됨.
  var visited = Set<Int>()
  
  while !queue.isEmpty {
    /// Step을 명확하게 분리하기 위해서 따로 생성
    /// 포문 내부를 보면 queue를 순회하게 되어있음.
    /// 순회하면서 새로운 값을 넣어주면 디버깅하는 입장에서도 복잡하고 필요 이상의 계산을 할 수 있게 됨.
    /// 그렇기 때문에 포문을 모두 종료 후, 업데이트 시켜줘야함.
    var nextQueue: [(position: Int, jumps: Int)] = []
    
    for (current, jumps) in queue {
      // point1: 최솟값을 찾는거기 때문에, 큰 수 부터 비교하는 거
      for fib in fibonacci.reversed() {
        let next = current + fib
        if next == N {
          return jumps + 1
        }
        if next > N
            || next < 0
            || visited.contains(next)
            || (next < N && A[next] == 0)
        {  continue }
        visited.insert(next)
        nextQueue.append((next, jumps + 1))
      }
    }
    queue = nextQueue
  }
  
  return -1
}

func generateFibonacci(upTo limit: Int) -> [Int] {
  var fibs = [0, 1]
  while let last = fibs.last, let secondLast = fibs.dropLast().last, last + secondLast <= limit {
    fibs.append(last + secondLast)
  }
  return Array(fibs.dropFirst(2))
}


//public func solution(_ A : inout [Int]) -> Int {
//  let N = A.count
//  let fibonacci = fibonacci(upTo: N + 1)
//
//  var visited = Array(repeating: false, count: N + 1)
//  var queue: [(position: Int, jumps: Int)] = [(-1, 0)]
//
//  while !queue.isEmpty {
//    let (current, jumps) = queue.removeFirst()
//
//    for fib in fibonacci {
//      let next = current + fib
//      if next == N {
//        return jumps + 1
//      }
//      if next > N || next < 0 || visited[next] || (next < N && A[next] == 0) {
//        continue
//      }
//      visited[next] = true
//      queue.append((next, jumps + 1))
//    }
//  }
//
//  return -1
//}

//public func solution(_ A : inout [Int]) -> Int {
//  var leafs: [Int] = []
//  for (index, value) in A.enumerated() where value == 1 {
//    leafs.append(index)
//  }
//  leafs.append(A.count)
//  print(leafs)
//
//  var jumpCount = 0
//  fib(A.count)
//
//  for i in 0..<leafs.count {
//    var index = i
//    var step = -1
//    var count = 0
//
//    while index < leafs.count {
//      let jump = leafs[index] - step
//
//      if fibCache[jump] != nil {
//        count += 1
//        step = jump
//      }
//      index += 1
//    }
//
//
//  }
//
//
//
//  return 0
//}

/// bfs, dfs ,bp의 특징을 한번 정리하는게 좋을 거 같음.
/// 언제 어떻게 쓰이는지에 대해서
/// 큰거부터 처리하는게 아직까지 경우에선 더 이득이 많았음.
/// 순열일 경우에 배열을 뒤집는걸 생각하자.

public func FibFrogsolution(_ A: inout [Int]) -> Int {
  let N = A.count
  
  var fibonacciNumbers = [Int]()
  fibonacciNumbers.append(1)
  fibonacciNumbers.append(2)
  
  var nextFib = 3
  while nextFib <= N + 1 {
    fibonacciNumbers.append(nextFib)
    nextFib = fibonacciNumbers[fibonacciNumbers.count - 1] + fibonacciNumbers[fibonacciNumbers.count - 2]
  }
  
  var visited = Array(repeating: false, count: N + 2)
  var queue = [(position: -1, jumps: 0)]
  visited[N + 1] = true
  
  var index = 0
  while index < queue.count {
    let current = queue[index]
    let currentPosition = current.position
    let currentJumps = current.jumps
    index += 1
    
    for fib in fibonacciNumbers.reversed() {
      let nextPosition = currentPosition + fib
      if nextPosition == N {
        return currentJumps + 1
      }
      if nextPosition < N && nextPosition >= 0 && A[nextPosition] == 1 && !visited[nextPosition] {
        visited[nextPosition] = true
        queue.append((position: nextPosition, jumps: currentJumps + 1))
      }
    }
  }
  
  return -1
}

//var dict: [Int: Int] = [:]
//
//@MainActor
//func fibononacci(_ n: Int) -> Int {
//  guard n > 1 else { return n }
//  if let value = dict[n] {
//    return value
//  }
//  let result = fibononacci(n - 1) + fibononacci(n - 2)
//  dict[n] = result
//
//  return result
//}
//
//@MainActor
//public func solution(_ A : inout [Int]) -> Int {
//  var step = -1
//  var count = 0
//
//  var indexHistory = 0
//
//  for (index, value) in A.enumerated() where value == 1 {
//    var i = 1
//    while fibononacci(i) <= index - step {
//      if (index - step) == fibononacci(i) {
//        count += 1
//        step = index
//      }
//      i += 1
//    }
//  }
//
//  var i = 1
//  while fibononacci(i) <= A.count - step {
//    if fibononacci(i) == A.count - step {
//      return count + 1
//    }
//    i += 1
//  }
//  return -1
//}
