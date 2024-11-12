//A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice contains at least two elements). The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).
//
//For example, array A such that:
//
//    A[0] = 4
//    A[1] = 2
//    A[2] = 2
//    A[3] = 5
//    A[4] = 1
//    A[5] = 5
//    A[6] = 8
//contains the following example slices:
//
//slice (1, 2), whose average is (2 + 2) / 2 = 2;
//slice (3, 4), whose average is (5 + 1) / 2 = 3;
//slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.
//The goal is to find the starting position of a slice whose average is minimal.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given a non-empty array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.
//
//For example, given array A such that:
//
//    A[0] = 4
//    A[1] = 2
//    A[2] = 2
//    A[3] = 5
//    A[4] = 1
//    A[5] = 5
//    A[6] = 8
//the function should return 1, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [2..100,000];
//each element of array A is an integer within the range [−10,000..10,000].


/// 배열의 부분은 2, 3으로 이루어진다는 걸 잊지 않기.

public func MinAvgTwoSlicesolution2(_ A : inout [Int]) -> Int {
  var minValue = Double(Int.max)
  var index = 0
  
  for i in 0..<(A.count - 1) {
    let sum2 = Double(A[i] + A[i + 1]) / 2
    if  sum2 < minValue {
      index = i
      minValue = sum2
    }
    
    if i < (A.count - 2) {
      let sum3 = Double((A[i] + A[i + 1] + A[i + 2])) / 3
      if sum3 < minValue {
        minValue = sum3
        index = i
      }
    }
  }
  
  return index
}

public func  MinAvgTwoSlicesolution(_ A : inout [Int]) -> Int {
  var minimum = Double.infinity
  var result = 0
  
  for i in 0..<A.count - 2 {
    let min2 = Double(A[i] + A[i + 1]) / 2
    if minimum > min2 {
      minimum = min2
      result = i
    }
    
    let min3 = Double(A[i] + A[i + 1] + A[i + 2]) / 3
    if minimum > min3 {
      minimum = min3
      result = i
    }
  }
  
  let temp = Double(A[A.count - 2] + A[A.count - 1]) / 2
  if temp < minimum {
    result = A.count - 2
  }
  
  return result
}
