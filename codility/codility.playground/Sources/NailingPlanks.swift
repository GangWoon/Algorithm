

/// TODO: 풀이 잊고 다시 풀기
///
///
///
/// binary search는 조금 더 많은 문제를 접해봐야지 감을 잡을 거 같음.
/// 문제를 1차원적으로 접근해서 이분탐색을 하려고하지 말고, 문제의 조건을 전제로 접근할 부분을 추출해서 binary search의 특징을 이용해야할 거 같음.
/// 이번 문제는 내가 풀 수 있던 문제가 아님.
public func NailingPlankssolution2(
_ A : inout [Int],
_ B : inout [Int],
_ C : inout [Int]
) -> Int {
func canNailAllPlanks(_ nailsCount: Int) -> Bool {
  var prefix = Array(repeating: 0, count: 2 * C.count + 1)
  
  for i in 0..<nailsCount {
    prefix[C[i]] += 1
  }
  for i in 1..<prefix.count {
    prefix[i] += prefix[i - 1]
  }
  
  for i in 0..<A.count {
    let start = A[i]
    let end = B[i]
    if prefix[end] - prefix[start - 1] <= 0 {
      return false
    }
  }
  return true
}

var left = 1
var right = C.count
var result = -1

while left <= right {
  let mid = (left + right) / 2
  if canNailAllPlanks(mid) {
    result = mid
    right = mid - 1
  } else {
    left = mid + 1
  }
}

return result
}

//) -> Int {
//  let sortA = A.enumerated()
//    .sorted {
//      if $0.element < $1.element {
//        return true
//      } else if $0.element == $1.element {
//        return B[$0.offset] < B[$1.offset]
//      } else {
//        return false
//      }
//    }
//  C.sort()
//
//  var i = (C.count - 1) / 2
//  var j = 0
//
//  var count = 0
//  var cache: Set<Int> = []
//
//
//  while // ??
//  let c = C[i]
//  let (offset, ele) = sortA[j]
//
//  if B[offset] <= c, ele >= c {
//    count += 1
//    cache.insert(c)
//  } else {
//    if c > B[offset] {
//      i -= 1
//    } else {
//      i += 1
//    }
//  }
//
//
//
//  return count == C.count ? cache.count : -1
//}

public func NailingPlankssolution(_ A: inout [Int], _ B: inout [Int], _ C: inout [Int]) -> Int {

  return -1
}
