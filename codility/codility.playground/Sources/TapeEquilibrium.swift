import Foundation
//A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.
//
//Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].
//
//The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|
//
//In other words, it is the absolute difference between the sum of the first part and the sum of the second part.
//
//For example, consider array A such that:
//
//  A[0] = 3
//  A[1] = 1
//  A[2] = 2
//  A[3] = 4
//  A[4] = 3
//We can split this tape in four places:
//
//P = 1, difference = |3 − 10| = 7
//P = 2, difference = |4 − 9| = 5
//P = 3, difference = |6 − 7| = 1
//P = 4, difference = |10 − 3| = 7
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.
//
//For example, given:
//
//  A[0] = 3
//  A[1] = 1
//  A[2] = 2
//  A[3] = 4
//  A[4] = 3
//the function should return 1, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [2..100,000];
//each element of array A is an integer within the range [−1,000..1,000].

///
///순회를 한번만 하더라도, 내부적으로 연산을 하면서 불필요한 순회를 제거하려고 노력하자.
///특히 고차함수는 의도가 명확하지 않는 경우 사용하지 않기. [중요함]
///totalSum을 정해두고, leftSum을 키워가면서 비교하기. 이렇게 했을 때, 순회를 최소화 시킬 수 있다.
///
///

/// 다시 해당 지점의 값이 필요없다면 배열이 아닌게 더 좋음.
public func TapeEquilibriumsolution2(_ A : inout [Int]) -> Int {
  var result = Int.max
  var max = A.reduce(0, +)
  var arr = [Int](repeating: 0, count: A.count)
  arr[0] = A[0]
  
  for i in 0..<(A.count - 1) {
    let sum: Int
    if i - 1 >= 0 {
      sum = arr[i - 1] + A[i]
    } else {
      sum = A[i]
    }
    let compared = (max - sum)
    result = min(abs(sum - compared), result)
    arr[i] = sum
  }
  
  return result
}


public func TapeEquilibriumsolution(_ A : inout [Int]) -> Int {
  let totalSum = A.reduce(0, +)
  
  var leftSum = 0
  var result = Int.max
  
  for i in 0..<A.count - 1 {
    leftSum += A[i]
    let rightSum = totalSum - leftSum
    result = min(abs(leftSum - rightSum), result)
  }
  
  return result
}
