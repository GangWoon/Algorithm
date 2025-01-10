
/// sliding window을 이해하면 쉽게 풀 수 있을 거 같음.
/// 문제 예시 풀이를 쫓을려고 하면 풀 수 없음. 역으로 보는 걸 더 연습해야할 거 같음.
public func CountDistinctSlicessolution2(_ M : Int, _ A : inout [Int]) -> Int {
  var left = 0
  var setA: Set<Int> = []
  var result = 0
  
  for right in 0..<A.count {
    while setA.contains(A[right]) {
      setA.remove(A[left])
      left += 1
    }
    setA.insert(A[right])
    result += right - left + 1
    if result >= 1_000_000_000 {
      return 1_000_000_000
    }
  }
  
  return result
}
//
//public func solution(_ M : Int, _ A : inout [Int]) -> Int {
//  var left = 0
//  var right = left
//  var setA: Set<Int> = []
//  
//  var result = 0
//  
//  while left < A.count || right < A.count {
//    let (inserted, _) = setA.insert(A[right])
//    if !inserted {
//      left += 1
//      right = left
//      setA = []
//    } else {
//      result += 1
//      if result == 1_000_000_000 {
//        return result
//      }
//      
//      if right == A.count - 1 {
//        left += 1
//        right = left
//      } else {
//        right += 1
//      }
//    }
//  }
//  
//  return result
//}

public func CountDistinctSlicessolution(_ M : Int, _ A : inout [Int]) -> Int {
  let N = A.count
  var result = 0
  var left = 0
  var right = 0
  
  var seen: [Bool] = .init(repeating: false, count: M + 1)
  while right < N {
    let rightValue = A[right]
    if !seen[rightValue] {
      seen[rightValue] = true
      result += (right - left + 1)
      right += 1
    } else {
      let leftValue = A[left]
      seen[leftValue] = false
      left += 1
    }
    if result > 1_000_000_000 {
      return 1_000_000_000
    }
  }
  
  return result
}
  
  
  //public func solution(_ M : Int, _ A : inout [Int]) -> Int {
  //  let N = A.count + 1
  //  var result = 0
  //  var left = 0
  //  var right = 0
  //
  //  while left != N || right != N {
  //    if left == right {
  //      result += 1
  //      right += 1
  //      continue
  //    }
  //    let range = left...(right - 1)
  //    if A[range].contains(A[right]) {
  //      left += 1
  //      right = left
  //    } else {
  //      right += 1
  //      result += 1
  //      if right == N - 1 {
  //        left += 1
  //        right = left
  //        result += 1
  //      }
  //    }
  //  }
  //
  //  return result
  //}
  
  //public func solution(_ M : Int, _ A : inout [Int]) -> Int {
  //  let N = A.count
  //  var result = 0
  //  var left = 0
  //  var right = 0
  //
  //  while left != N || right != N {
  //    if left == right {
  //      result += 1
  //      right += 1
  //      continue
  //    }
  //    let range = left...right
  //    print(range, A[range], A[right], result)
  //
  //
  //    if !A[range].contains(A[right]) {
  //      left += 1
  //      right = left
  //    } else {
  //      if right <= N - 1 {
  //        if right == N - 1 {
  //          left += 1
  //          right = left
  //        } else {
  //          right += 1
  //        }
  //        result += 1
  //      }
  //    }
  //  }
  //
  //  return result
  //}
