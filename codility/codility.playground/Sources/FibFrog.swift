import Foundation

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
