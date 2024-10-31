
/// 정렬을 활용해서 가장 큰 수와 가장 작은 수를 더하는 방식으로 접근해야 풀 수 있음.
///
public func MinAbsSumOfTwosolution(_ A : inout [Int]) -> Int {
  A.sort()
  var left = 0
  var right = A.count - 1
  var result = Int.max
  
  while left <= right {
    let sum = A[left] + A[right]
    result = min(result, abs(sum))
    if sum < 0 {
      left += 1
    } else {
      right -= 1
    }
  }
  
  return result
}

//public func solution(_ A : inout [Int]) -> Int {
//  A.sort()
//  let N = A.count
//  var result = Int.max
//
//
//  for i in 0..<N {
//    var temp = abs(A[i] + A[i])
//    for j in 0..<N {
//      if temp < abs(A[i] + A[j]) {
//        break
//      }
//      let value = abs(A[i] + A[j])
//      temp = value
//      print(i, j, "Value: \(A[i]) \(A[j]) \(value)")
//      result = min(result, value)
//    }
//  }
//
//
//  return result
//}
