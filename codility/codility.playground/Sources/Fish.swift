
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
