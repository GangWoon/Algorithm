//An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
//
//A[P] + A[Q] > A[R],
//A[Q] + A[R] > A[P],
//A[R] + A[P] > A[Q].
//For example, consider array A such that:
//
//  A[0] = 10    A[1] = 2    A[2] = 5
//  A[3] = 1     A[4] = 8    A[5] = 20
//Triplet (0, 2, 4) is triangular.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given an array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.
//
//For example, given array A such that:
//
//  A[0] = 10    A[1] = 2    A[2] = 5
//  A[3] = 1     A[4] = 8    A[5] = 20
//the function should return 1, as explained above. Given array A such that:
//
//  A[0] = 10    A[1] = 50    A[2] = 5
//  A[3] = 1
//the function should return 0.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..100,000];
//each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].

/// 항상 문제 제대로 읽기 열심히 읽기

/// 문제는 통과했지만, 삼각형 부등식 법칙을 활용하는게 더 정확하다고 함.
/// 정렬된 배열에서, A[i] + A[i + 1] > A[i + 2]가 성립하면
/// A[i + 1] > A[i + 2] > A[i]
/// A[i + 2] + A[i] > A[i + 1]은 당연하게 성립한다고 함. 생각해보면 맞음.
/// 그렇기 때문에 정렬하고 A.count - 2만큼만 순회하면 된다.

//public func Trianglesolution2(_ A : inout [Int]) -> Int {
//  A.sort()
//
//  var i = 0
//  var j = 1
//  var k = 2
//  
//  while i < A.count - 2 {
//    if A[i] + A[j] > A[k] {
//      if A[j] + A[k] > A[i] {
//        if A[i] + A[k] > A[j] {
//          return 1
//        } else {
//          k += 1
//        }
//      } else {
//        j += 1
//        k = j + 1
//      }
//    } else {
//      i += 1
//      j = i + 1
//      k = j + 1
//    }
//  }
//  
//  return 0
//}

public func Trianglesolution(_ A : inout [Int]) -> Int {
  if A.count < 3 {
    return 0
  }
  A.sort()
  
  for i in 0..<(A.count - 2) {
    if A[i] + A[i + 1] > A[i + 2] {
      return 1
    }
  }
  
  return 0
}
