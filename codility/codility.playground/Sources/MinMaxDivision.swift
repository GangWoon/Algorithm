/// 이진 검색을 풀 때는 사고를 조금 더 다양하게 접근해야 할 거 같음.
/// 배열 A의 최대 값이 배열을 분리시켰을 때

public func MinMaxDivisionsolution2(
  _ K : Int,
  _ M : Int,
  _ A : inout [Int]
) -> Int {
  var left = A.max()!
  var right = A.reduce(0, +)
  var result = right
  
  while left <= right {
    let mid = (left + right) / 2
    if canDivide2(A, K, mid) {
      result = mid
      right = mid - 1
    } else {
      left = mid + 1
    }
  }
  
  return result
}

func canDivide2(_ A: [Int], _ K: Int, _ maxSum: Int) -> Bool {
  var count = 1
  var sum = 0
  
  for value in A {
    if sum + value > maxSum {
      count += 1
      sum = value
      if count > K {
        return false
      }
    } else {
      sum += value
    }
  }
  
  return true
}



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
