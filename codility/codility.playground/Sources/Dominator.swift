//An array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.
//
//For example, consider array A such that
//
// A[0] = 3    A[1] = 4    A[2] =  3
// A[3] = 2    A[4] = 3    A[5] = -1
// A[6] = 3    A[7] = 3
//The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.
//
//Write a function
//
//class Solution { public int solution(int[] A); }
//
//that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.
//
//For example, given array A such that
//
// A[0] = 3    A[1] = 4    A[2] =  3
// A[3] = 2    A[4] = 3    A[5] = -1
// A[6] = 3    A[7] = 3
//the function may return 0, 2, 4, 6 or 7, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..100,000];
//each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].

/// 배열 순회할 때는 항상 조심히.// <- 이게 참 어려운듯

/// 보일러 무어를 이용할 것, 내 방식에서 문제가 발생할수도 있었고, 공간 복잡도를 생각해보면 비효율적임.
public func Dominatorsolution2(_ A : inout [Int]) -> Int {
  let N = A.count
  guard N > 0 else { return -1 }
  
  var candidate: Int?
  var count = 0
  
  for num in A {
    if count == 0 {
      candidate = num
      count = 1
    } else if candidate == num {
      count += 1
    } else {
      count -= 1
    }
  }
  
  /// 딕셔너리를 사용하지 않으면, 공간 복잡도를 획기적으로 줄일 수 있음.
  /// 알고리즘을 풀 때, 왠만하면 딕셔너리를 피하려고 노력해봅시다.
  guard let dominator = candidate else { return -1 }
  let dominatorCount = A.filter { $0 == dominator }.count
  if dominatorCount > N / 2 {
    return A.firstIndex(of: dominator)!
  }
  
  return -1
}
//public func solution(_ A : inout [Int]) -> Int {
//  var arr: [Int: Int] = [:]
//  var maxValue = 0
//  var result = 0
//
//  for (index, num) in A.enumerated() {
//    arr[num, default: 0] += 1
//    if maxValue != num, maxValue < arr[num]! {
//      result = index
//      maxValue = arr[num]!
//    }
//    maxValue = max(maxValue, arr[num]!)
//    if maxValue > A.count / 2 {
//      return result
//    }
//  }
//
//  return -1
//}


public func Dominatorsolution(_ A : inout [Int]) -> Int {
  var count: [Int: Int] = [:]
  var dominator: Int?
  
  for value in A {
    count[value, default: 0] += 1
    
    if count[value]! > A.count / 2 {
      dominator = value
      break
    }
  }
  guard let dominator else {
     return -1
  }
  
  for (index, value) in A.enumerated() {
    if value == dominator {
      return index
    }
  }
  
  return -1
}
