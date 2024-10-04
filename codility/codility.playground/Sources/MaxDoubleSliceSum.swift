import Foundation
//A non-empty array A consisting of N integers is given.
//
//A triplet (X, Y, Z), such that 0 ≤ X < Y < Z < N, is called a double slice.
//
//The sum of double slice (X, Y, Z) is the total of A[X + 1] + A[X + 2] + ... + A[Y − 1] + A[Y + 1] + A[Y + 2] + ... + A[Z − 1].
//
//For example, array A such that:
//
//    A[0] = 3
//    A[1] = 2
//    A[2] = 6
//    A[3] = -1
//    A[4] = 4
//    A[5] = 5
//    A[6] = -1
//    A[7] = 2
//contains the following example double slices:
//
//double slice (0, 3, 6), sum is 2 + 6 + 4 + 5 = 17,
//double slice (0, 3, 7), sum is 2 + 6 + 4 + 5 − 1 = 16,
//double slice (3, 4, 5), sum is 0.
//The goal is to find the maximal sum of any double slice.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given a non-empty array A consisting of N integers, returns the maximal sum of any double slice.
//
//For example, given:
//
//    A[0] = 3
//    A[1] = 2
//    A[2] = 6
//    A[3] = -1
//    A[4] = 4
//    A[5] = 5
//    A[6] = -1
//    A[7] = 2
//the function should return 17, because no double slice of array A has a sum of greater than 17.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [3..100,000];
//each element of array A is an integer within the range [−10,000..10,000].
/// 문제를 잘 분석해보기
/// MARK: - 다시 풀어보기

public func MaxDoubleSliceSumsolution(_ A : inout [Int]) -> Int {
  let N = A.count
  if N < 4 { return 0 }
  
  var leftMax: [Int] = .init(repeating: 0, count: N)
  for i in 1..<N-1 {
    leftMax[i] = max(0, leftMax[i - 1] + A[i])
  }
  
  var rightMax: [Int] = .init(repeating: 0, count: N)
  // range를 역으로 생성하고 싶을 때는 stride을 사용하면된다.
  for i in stride(from: N - 2, through: 1, by: -1) {
    rightMax[i] = max(0, rightMax[i + 1] + A[i])
    print(rightMax[i])
  }
  
  var maxDoubleSlice = 0
  for i in 1..<N-1 {
    maxDoubleSlice = max(maxDoubleSlice, leftMax[i-1] + rightMax[i+1])
  }
  
  return maxDoubleSlice
}
