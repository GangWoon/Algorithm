public func NumberSolitairesolution(_ A : inout [Int]) -> Int {
  let N = A.count
  if N == 1 { return A[0] }
  
  var dp = Array(repeating: Int.min, count: N)
  dp[0] = A[0]
  
  for i in 1..<N {
    for j in 1...6 {
      if i - j >= 0 {
        dp[i] = max(dp[i], dp[i - j] + A[i])
      }
    }
  }
  
  return dp[N - 1]
}

//public func solution(_ A : inout [Int]) -> Int {
//  let N = A.count
//  var result = A.first!
//  var i = 1
//
//  while i < N {
//    let range = i...min(i + 6, N - 1)
//    var temp = A[i]
//
//    for index in range where temp < A[index] {
//      i = index
//      temp = A[i]
//    }
//    result += temp
//    if range.contains(N - 1) {
//      break
//    }
//  }
//
//  result += A.last!
//
//  return result
//}
