//This is a demo task.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
//
//For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
//
//Given A = [1, 2, 3], the function should return 4.
//
//Given A = [−1, −3], the function should return 1.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//each element of array A is an integer within the range [−1,000,000..1,000,000].

/// 반복문을 돌릴 때, 전부를 순회하려고 하지말고, 진짜 원하는 조건이 무엇인지 한번 더 생각하기

public func MissingIntegersolution2(_ A : inout [Int]) -> Int {
  let arr = Set(A).sorted()
  var result = 1
  
  for ele in arr where ele > 0 {
    if ele <= result {
      result = ele + 1
    }
  }
  
  return result
}

public func MissingIntegersolution(_ A : inout [Int]) -> Int {
  let setA = Set(A)
  var result = 1
  
  while setA.contains(result) {
    result += 1
  }
  
//  for _ in 0..<setA.count {
//    if setA.contains(result) {
//      result += 1
//    }
//  }
  
  return result
}
