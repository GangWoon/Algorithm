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
