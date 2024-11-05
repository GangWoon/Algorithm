fpublic func MaxNonoverlappingSegmentssolution(_ A : inout [Int], _ B : inout [Int]) -> Int {
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
