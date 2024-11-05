public func TieRopessolution(_ K : Int, _ A : inout [Int]) -> Int {
  var result = 0
  var temp = 0
  
  for length in A {
    temp += length
    if temp >= K {
      result += 1
      temp = 0
    }
  }
  return result
}

//public func solution(_ K : Int, _ A : inout [Int]) -> Int {
//  let N = A.count
//  if N == 0 { return 0 }
//
//  var temp = A[0]
//  var result = 0
//
//  for i in 1 ..< N {
//    if temp + A[i] >= K {
//      if i + 1 < N {
//        temp = A[i + 1]
//      }
//      result += 1
//    } else {
//      temp += A[i]
//    }
//  }
//
//  return result
//}
