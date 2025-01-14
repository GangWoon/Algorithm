import Foundation

//A non-empty array A consisting of N integers is given.
//
//A peak is an array element which is larger than its neighbours. More precisely, it is an index P such that 0 < P < N − 1 and A[P − 1] < A[P] > A[P + 1].
//
//For example, the following array A:
//
//    A[0] = 1
//    A[1] = 5
//    A[2] = 3
//    A[3] = 4
//    A[4] = 3
//    A[5] = 4
//    A[6] = 1
//    A[7] = 2
//    A[8] = 3
//    A[9] = 4
//    A[10] = 6
//    A[11] = 2
//has exactly four peaks: elements 1, 3, 5 and 10.
//
//You are going on a trip to a range of mountains whose relative heights are represented by array A, as shown in a figure below. You have to choose how many flags you should take with you. The goal is to set the maximum number of flags on the peaks, according to certain rules.
//
//
//
//Flags can only be set on peaks. What's more, if you take K flags, then the distance between any two flags should be greater than or equal to K. The distance between indices P and Q is the absolute value |P − Q|.
//
//For example, given the mountain range represented by array A, above, with N = 12, if you take:
//
//two flags, you can set them on peaks 1 and 5;
//three flags, you can set them on peaks 1, 5 and 10;
//four flags, you can set only three flags, on peaks 1, 5 and 10.
//You can therefore set a maximum of three flags in this case.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given a non-empty array A of N integers, returns the maximum number of flags that can be set on the peaks of the array.
//
//For example, the following array A:
//
//    A[0] = 1
//    A[1] = 5
//    A[2] = 3
//    A[3] = 4
//    A[4] = 3
//    A[5] = 4
//    A[6] = 1
//    A[7] = 2
//    A[8] = 3
//    A[9] = 4
//    A[10] = 6
//    A[11] = 2
//the function should return 3, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..400,000];
//each element of array A is an integer within the range [0..1,000,000,000].
// MARK: - 다시 풀기

/// 이진트리 검색 방식 다른거 풀어봐야할듯?
public func Flagssolution2(_ A: inout [Int]) -> Int {
  let N = A.count
  guard N > 2 else { return 0 }
  
  /// 필요한 데이터를 저장하는 방식이 중요.
  /// 배열을 무작정 만들 필요는 없음.
  var peaks = [Int]()
  for i in 1..<N-1 {
    if A[i - 1] < A[i], A[i] > A[i + 1] {
      peaks.append(i)
    }
  }
  if peaks.isEmpty { return 0 }
  
  var left = 1
  var right = peaks.count
  var result = 0
  
  func canPlaceFlags(_ k: Int) -> Bool {
    var flags = 1
    var lastFlagPosition = peaks[0]
    
    for i in 1..<peaks.count {
      if peaks[i] - lastFlagPosition >= k {
        flags += 1
        lastFlagPosition = peaks[i]
        if flags == k { return true }
      }
    }
    return flags >= k
  }
  
  while left <= right {
    let mid = (left + right) / 2
    if canPlaceFlags(mid) {
      result = mid
      left = mid + 1
    } else {
      right = mid - 1
    }
  }
  
  return result
}

public func Flagssolution(_ A: inout [Int]) -> Int {
  if A.count < 3 {
    return 0
  }
  var peaks: [Int] = []
  for i in 1..<A.count - 1 {
    if A[i] > A[i - 1], A[i] > A[i + 1] {
      peaks.append(i)
    }
  }
  
  if peaks.isEmpty {
    return 0
  }

  var left = 1
  var right = peaks.count
  var result = 1
  
  while left <= right {
    let mid = (left + right) / 2
    if canPlaceFlags(peaks, mid) {
      result = mid
      left = mid + 1
    } else {
      right = mid - 1
    }
  }
  
  return result
}


func canPlaceFlags(_ peaks: [Int], _ K: Int) -> Bool {
  var flagsUsed = 1
  var lastPosition = peaks[0]
  
  for i in 1..<peaks.count {
    if peaks[i] - lastPosition >= K {
      flagsUsed += 1
      lastPosition = peaks[i]
      if flagsUsed >= K {
        return true
      }
    }
  }
  
  return false
}
