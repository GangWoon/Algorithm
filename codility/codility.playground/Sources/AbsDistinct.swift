public func AbsDistinctsolution2(_ A : inout [Int]) -> Int {
  var setA: Set<Int> = []
  A.forEach {
    setA.insert(abs($0))
  }
  
  return setA.count
}


public func AbsDistinctsolution(_ A : inout [Int]) -> Int {
  var left = 0
  var right = A.count - 1
  var arr: Set<Int> = []
  
  while left <= right {
    let leftValue = abs(A[left])
    let rightValue = abs(A[right])
    if leftValue > rightValue {
      arr.insert(leftValue)
      left += 1
    } else {
      arr.insert(rightValue)
      right -= 1
    }
  }
  return arr.count
}
