public func CountTrianglessolution(_ A: inout [Int]) -> Int {
  let N = A.count
  if N < 3 {
    return 0
  }
  
  A.sort()
  var result = 0
  
  for i in 0 ..< N - 2 {
    var k = i + 2
    for j in i + 1 ..< N - 1 {
      while k < N && A[i] + A[j] > A[k] {
        k += 1
      }
      result += k - j - 1
    }
  }
  
  return result
}

//public func solution(_ A: inout [Int]) -> Int {
//  A.sort()
//
//  var i = 0
//  var j = 1
//  var k = 2
//
//  var result = 0
//
//  while i != A.count && j != A.count && k != A.count {
//    print(i, j, k)
//    if A[i] + A[j] > A[k] {
//      result += 1
//      if k == A.count - 1 {
//        if j == A.count - 2 {
//          if i == A.count - 3 {
//            break
//          } else {
//            i += 1
//          }
//        } else {
//          j += 1
//        }
//
//      } else {
//        k += 1
//      }
//    } else {
//      if j == A.count - 2 {
//        i += 1
//        j = i + 1
//      } else {
//        j += 1
//      }
//      k = j + 1
//    }
//  }
//
//
//  return result
//}
