import Foundation

//A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The sum of a slice (P, Q) is the total of A[P] + A[P+1] + ... + A[Q].
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given an array A consisting of N integers, returns the maximum sum of any slice of A.
//
//For example, given array A such that:
//
//A[0] = 3  A[1] = 2  A[2] = -6
//A[3] = 4  A[4] = 0
//the function should return 5 because:
//
//(3, 4) is a slice of A that has sum 4,
//(2, 2) is a slice of A that has sum −6,
//(0, 1) is a slice of A that has sum 5,
//no other slice of A has sum greater than (0, 1).
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..1,000,000];
//each element of array A is an integer within the range [−1,000,000..1,000,000];
//the result will be an integer within the range [−2,147,483,648..2,147,483,647].

/// 카데인 알고리즘을 생각할 수 있어야함.
/// 현재까지의 합이 음수일 경우, 새로 시작하는게 최적화.
public func MaxSliceSumsolution2(_ A : inout [Int]) -> Int {
  var maxSum = A[0]
  var currentSum = A[0]
  
  for i in 1..<A.count {
    currentSum = max(A[i], currentSum + A[i])
    maxSum = max(maxSum, currentSum)
  }
  
  return maxSum
}

public func MaxSliceSumsolution(_ A : inout [Int]) -> Int {
  var currentMax = A[0]
  var globalMax = A[0]
  
  for i in 1..<A.count {
    currentMax = max(A[i], currentMax + A[i])
    globalMax = max(currentMax, globalMax)
  }
  
  
  return globalMax
}
