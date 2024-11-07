//An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
//
//Your goal is to find that missing element.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given an array A, returns the value of the missing element.
//
//For example, given array A such that:
//
//  A[0] = 2
//  A[1] = 3
//  A[2] = 1
//  A[3] = 5
//the function should return 4, as it is the missing element.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..100,000];
//the elements of A are all distinct;
//each element of array A is an integer within the range [1..(N + 1)].

///
/// 등차 수열이 생각나야하는 문제, 하나의 값을 찾으려고 순회하려 하지말고 전체적인 틀을 보고
/// 문제를 접근해야지 효율적으로 풀 수 있다.
///

public func PermMissingElemsolution2(_ A : inout [Int]) -> Int {
  let N = A.count
  return ((N + 1) * (N + 2)) / 2 - A.reduce(0, +)
}

public func PermMissingElemsolution(_ A : inout [Int]) -> Int {
  let N = A.count
  return ((N + 1) * (N + 2) / 2) - A.reduce(into: 0, +=)
}
