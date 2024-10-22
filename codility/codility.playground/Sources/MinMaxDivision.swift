/// 문제를 잘 읽고, 많이 풀어보자.

public func MinMaxDivisionsolution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int {
  var low = A.max()!
  var high = A.reduce(0, +)
  
  var result = low
  while low <= high {
    let mid = (low + high) / 2
    
    if canDivide(A, K, mid) {
      result = mid
      high = mid - 1
    } else {
      low = mid + 1
    }
  }
  
  return result
}

func canDivide(_ A: [Int], _ K: Int, _ minValue: Int) -> Bool {
  var boxCounts = 1
  var currentSum = 0
  
  for element in A {
    if currentSum + element > minValue {
      boxCounts += 1
      currentSum = element
      if boxCounts > K {
        return false
      }
    } else {
      currentSum += element
    }
  }
  
  return true
}
