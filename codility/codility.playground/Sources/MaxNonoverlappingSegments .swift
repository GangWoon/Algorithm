// 망상하지 않기, 문제를 풀 떄 정확한 사실들만 나열하려고 노력해보자.
// 문제 접근은 바로했지만 이상한 생각으로 인해서 틀림.
public func MaxNonoverlappingSegmentssolution2(_ A : inout [Int], _ B : inout [Int]) -> Int {
  let N = A.count
  if N == 0 { return 0}

  var result = 0
  var lastEnd = -1
  
  for i in 0..<N {
    if A[i] > lastEnd {
      result += 1
      lastEnd = B[i]
    }
  }
  
  return result
}

public func MaxNonoverlappingSegmentssolution(_ A : inout [Int], _ B : inout [Int]) -> Int {
  let N = A.count
  if N == 0 { return 0 }
  
  var result = 1
  var lastEnd = B[0]
  
  for i in 1..<N {
    if A[i] > lastEnd {
      result += 1
      lastEnd = B[i]
    }
  }
  
  return result
}

//public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
//  let N = A.count
//  var result = 0
//
//  for i in 0..<N {
//    var item: [ClosedRange<Int>] = [A[i]...B[i]]
//
//    var n = i + 1
//    while n < N {
//      if item.last!.contains(A[n]) {
//        break
//      }
//      item.append(A[n]...B[n])
//      n += 1
//    }
//    result = max(result, item.count)
//  }
//
//
//  return result
//}
