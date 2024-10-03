//You are given N counters, initially set to 0, and you have two possible operations on them:
//
//increase(X) − counter X is increased by 1,
//max counter − all counters are set to the maximum value of any counter.
//A non-empty array A of M integers is given. This array represents consecutive operations:
//
//if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
//if A[K] = N + 1 then operation K is max counter.
//For example, given integer N = 5 and array A such that:
//
//    A[0] = 3
//    A[1] = 4
//    A[2] = 4
//    A[3] = 6
//    A[4] = 1
//    A[5] = 4
//    A[6] = 4
//the values of the counters after each consecutive operation will be:
//
//    (0, 0, 1, 0, 0)
//    (0, 0, 1, 1, 0)
//    (0, 0, 1, 2, 0)
//    (2, 2, 2, 2, 2)
//    (3, 2, 2, 2, 2)
//    (3, 2, 2, 3, 2)
//    (3, 2, 2, 4, 2)
//The goal is to calculate the value of every counter after all operations.
//
//Write a function:
//
//public func solution(_ N : Int, _ A : inout [Int]) -> [Int]
//
//that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of integers representing the values of the counters.
//
//Result array should be returned as an array of integers.
//
//For example, given:
//
//    A[0] = 3
//    A[1] = 4
//    A[2] = 4
//    A[3] = 6
//    A[4] = 1
//    A[5] = 4
//    A[6] = 4
//the function should return [3, 2, 2, 4, 2], as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N and M are integers within the range [1..100,000];
//each element of array A is an integer within the range [1..N + 1].

///
///전체 업데이트가 발생했을 때, 배열 전체를 업데이트 시키지 않는게 포인트
///increase 연산이 발생했을 때, 분기를 통해서 업데이트
///

public func MaxCounterssolution(_ N : Int, _ A : inout [Int]) -> [Int] {
  var arr: [Int] = .init(repeating: 0, count: N)
  
  var currentMax = 0
  var lastUpdated = 0
  
  for item in A {
    if item == N + 1 {
      lastUpdated = currentMax
    } else {
     let index = item - 1
      arr[index] = max(lastUpdated, arr[index]) + 1
      currentMax = max(arr[index], currentMax)
    }
  }
  
  for i in 0..<N {
    arr[i] = max(arr[i], lastUpdated)
  }
  
 return arr
}
