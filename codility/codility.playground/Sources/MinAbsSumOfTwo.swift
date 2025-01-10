

/// 음수에서 가장 큰 값과 양수에서 가장 큰 값을 더한게 가장 클 수 있음. x
/// -100, 2 = 98
/// -3, 2 = 1
///
/// 음수와 양수의 조합은 둘의 abs값이 가까울 수 록 값이 작음.
///
/// 양수와 양수의 조합은 작은 수를 더할 수 록 값이 작음
///
/// 음수와 음수의 조합은 가장 작은 수를 더할 수록 값이 작음.


/// -100, -1, 3,  8, 90
///-100, 90 -> 10
///-1 , 90 -> 89, 2 [2]
///-1 ,8 -> 7
///-1, 3 -> 2
///
/// 반복문 조건을 left <= right로 걸 경우 가장 작은 값의 포인터까지 오기 때문에 굳이 복잡하게 문제를 풀필요는 없다.
/// 그래도 맞았으니 나이스 :)

public func MinAbsSumOfTwosolution2(_ A : inout [Int]) -> Int {
  A.sort()
  var left = 0
  var right = A.count - 1
  var minSum = Int.max
  
  while left <= right {
    let currentSum = A[left] + A[right]
    minSum = min(minSum, abs(currentSum))
    
    if abs(A[left]) > abs(A[right]) {
      left += 1
    } else {
      right -= 1
    }
  }
  return minSum
}

//public func solution(_ A : inout [Int]) -> Int {
//  A.sort()
//  var minus = [Int]()
//  var plus = [Int]()
//  
//  for a in A {
//    if a >= 0 {
//      plus.append(a)
//    } else {
//      minus.append(a)
//    }
//  }
//  
//  if !minus.isEmpty, !plus.isEmpty {
//    var left = 0
//    var right = A.count - 1
//    
//    var sum = abs(A[left] * 2)
//    while left < right {
//      let a = abs(A[left])
//      let b = abs(A[right])
//      sum = min(abs(A[left] + A[right]), 2 * a, 2 * b, sum)
//      if a > b {
//        left += 1
//      } else {
//        right -= 1
//      }
//    }
//    return sum
//  } else {
//    if plus.isEmpty {
//      let n = minus.count - 1
//      return abs(minus.last! * 2)
//    } else {
//      let n = plus.count - 1
//      return (plus.first! * 2)
//    }
//  }
//}

/// 정렬을 활용해서 가장 큰 수와 가장 작은 수를 더하는 방식으로 접근해야 풀 수 있음.
///
public func MinAbsSumOfTwosolution(_ A : inout [Int]) -> Int {
  A.sort()
  var left = 0
  var right = A.count - 1
  var result = Int.max
  
  while left <= right {
    let sum = A[left] + A[right]
    result = min(result, abs(sum))
    if sum < 0 {
      left += 1
    } else {
      right -= 1
    }
  }
  
  return result
}

//public func solution(_ A : inout [Int]) -> Int {
//  A.sort()
//  let N = A.count
//  var result = Int.max
//
//
//  for i in 0..<N {
//    var temp = abs(A[i] + A[i])
//    for j in 0..<N {
//      if temp < abs(A[i] + A[j]) {
//        break
//      }
//      let value = abs(A[i] + A[j])
//      temp = value
//      print(i, j, "Value: \(A[i]) \(A[j]) \(value)")
//      result = min(result, value)
//    }
//  }
//
//
//  return result
//}
