//We draw N discs on a plane. The discs are numbered from 0 to N − 1. An array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].
//
//We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).
//
//The figure below shows discs drawn for N = 6 and A as follows:
//
//  A[0] = 1
//  A[1] = 5
//  A[2] = 2
//  A[3] = 1
//  A[4] = 4
//  A[5] = 0
//
//
//There are eleven (unordered) pairs of discs that intersect, namely:
//
//discs 1 and 4 intersect, and both intersect with all the other discs;
//disc 2 also intersects with discs 0 and 3.
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.
//
//Given array A shown above, the function should return 11, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..100,000];
//each element of array A is an integer within the range [0..2,147,483,647].

/// MARK: - 다시 풀어보기
/// 내가 푼게 아님.
///
///
/// 두번째도 내가 풀지 못함. "스위핑 알고리즘" 문제를 더 풀어봐야 알수 있을 거 같음.
public func NumberOfDiscIntersectionssolution2(_ A : inout [Int]) -> Int {
  let N = A.count
  guard N > 1 else { return 0 }
  
  var startPoints: [Int] = .init(repeating: 0, count: N)
  var endPoints: [Int] = .init(repeating: 0, count: N)
  
  for i in 0..<N {
    startPoints[i] = i - A[i]
    endPoints[i] = i + A[i]
  }
  
  startPoints.sort()
  endPoints.sort()
  
  var activeDiscs = 0
  var intersections = 0
  var startIndex = 0
  var endIndex = 0
  
  while startIndex < N {
    if startPoints[startIndex] <= endPoints[endIndex] {
      intersections += activeDiscs
      if intersections > 10_000_000 {
        return -1
      }
      activeDiscs += 1
      startIndex += 1
    } else {
      activeDiscs -= 1
      endIndex += 1
    }
  }
  
  return intersections
}

public func NumberOfDiscIntersectionssolution(_ A : inout [Int]) -> Int {
  let N = A.count
  if N < 2 {
    return 0
  }
  
  /// Part 1
  var startPoints: [Int] = .init(repeating: 0, count: N)
  var endPoints: [Int] = .init(repeating: 0, count: N)
  
  for i in 0..<N {
    startPoints[i] = i - A[i]
    endPoints[i] = i + A[i]
  }
  startPoints.sort()
  endPoints.sort()
  
  var activeCircles = 0
  var intersectionCount = 0
  var endIndex = 0
  
  // Part2
  for i in 0..<N {
    while endIndex < N && endPoints[endIndex] < startPoints[i] {
      activeCircles -= 1
      endIndex += 1
    }
    
    intersectionCount += activeCircles
    if intersectionCount > 10_000_000 {
      return -1
    }
    
    activeCircles += 1
  }
  
  return intersectionCount
}
