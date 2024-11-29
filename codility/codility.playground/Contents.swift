public func solution(_ A : inout [Int]) -> Int {
  var maxSum = A[0]
  var currentSum = A[0]
  
  for i in 1..<A.count {
    currentSum = max(A[i], currentSum + A[i])
    maxSum = max(maxSum, currentSum)
  }
  
  return maxSum
}


var a = [3, 2, -6, 4, 0]

solution(&a)
