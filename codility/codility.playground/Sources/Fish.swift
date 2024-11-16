public func Fishsolution2(_ A : inout [Int], _ B : inout [Int]) -> Int {
  var stack: [Int] = []
  var count = 0
  
  for i in 0..<A.count {
    if B[i] == 1 {
      stack.append(A[i])
    } else {
      while !stack.isEmpty {
        if stack.last! > A[i] {
          break
        } else {
          stack.removeLast()
        }
      }
      
      if stack.isEmpty {
        count += 1
      }
    }
  }

  return count + stack.count
}

//public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
//  var weight = 0
//  var count = 0
//
//  for i in 0..<A.count {
//    if B[i] == 1 {
//      weight = A[i]
//    } else {
//      if weight < A[i] {
//        count += 1
//        weight = 0
//      }
//    }
//  }
//
//  return count
//}


public func Fishsolution(_ A : inout [Int], _ B : inout [Int]) -> Int {
  var upSide = 0
  var downSide: [Int] = []
  
  for (weight, side) in zip(A, B) {
    if side == 1 {
      downSide.append(weight)
    } else {
      while let last = downSide.last {
        if last < weight {
          downSide.removeLast()
        } else {
          break
        }
      }
      
      if downSide.isEmpty {
        upSide += 1
      }
    }
  }
  
  return downSide.count + upSide
}
