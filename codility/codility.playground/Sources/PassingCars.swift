//A non-empty array A consisting of N integers is given. The consecutive elements of array A represent consecutive cars on a road.
//
//Array A contains only 0s and/or 1s:
//
//0 represents a car traveling east,
//1 represents a car traveling west.
//The goal is to count passing cars. We say that a pair of cars (P, Q), where 0 ≤ P < Q < N, is passing when P is traveling to the east and Q is traveling to the west.
//
//For example, consider array A such that:
//
//  A[0] = 0
//  A[1] = 1
//  A[2] = 0
//  A[3] = 1
//  A[4] = 1
//We have five pairs of passing cars: (0, 1), (0, 3), (0, 4), (2, 3), (2, 4).
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given a non-empty array A of N integers, returns the number of pairs of passing cars.
//
//The function should return −1 if the number of pairs of passing cars exceeds 1,000,000,000.
//
//For example, given:
//
//  A[0] = 0
//  A[1] = 1
//  A[2] = 0
//  A[3] = 1
//  A[4] = 1
//the function should return 5, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//each element of array A is an integer that can have one of the following values: 0, 1.

/// 문제를 다양하게 볼 수 있어야함.

public func PassingCarssolution2ㄹ(_ A : inout [Int]) -> Int {
  A.reverse()
  var value = 0
  var result = 0
  
  for ele in A {
    if ele == 1 {
      value += 1
    } else {
      result += value
      if result > 1_000_000_000 {
        return -1
      }
    }
  }
  
  return result
}

public func PassingCarssolution(_ A : inout [Int]) -> Int {
  var eastCount = 0
  var passingCount = 0
  
  for car in A {
    if car == 0 {
      eastCount += 1
    } else {
      passingCount += eastCount
      
      if passingCount > 1_000_000_000 {
        return -1
      }
    }
  }
  
  return passingCount
}
