/// 문제 풀때 카테고리부터 학습하고 풀기.
/// 

/// 유클리드 호제법 통한 gcd계산
/// A, B 중 큰 수에서 작은 수를 나눈다.
///  나머지가 0이 될 때 까지 계산하기, 0이라면 작은수가 gcd임.
///
///  패턴의 길이를 결정하고 <- gcd를 뜻함.
///  전체 길이를 패턴으로 나눈 값이 결과 값이 됨.

public func ChocolatesByNumberssolution2(_ N : Int, _ M : Int) -> Int {
  return N / gcd(N, M)
}

func gcd2(_ lhs: Int, _ rhs: Int) -> Int {
  let maxValue = max(lhs, rhs)
  let minValue = min(lhs, rhs)
  
  let value = maxValue % minValue
  if value == 0 {
    return minValue
  }
  
  return gcd(minValue, value)
}

//public func solution(_ N : Int, _ M : Int) -> Int {
//  var arr = [Bool](repeating: true, count: N)
//  var result = 0
//
//  var i = 0
//  var flag = false
//  while !flag {
//    if !arr[i] {
//      flag = true
//      break
//    } else {
//      arr[i] = false
//    }
//
//    i = (i + M) % N
//    print(i)
//    result += 1
//  }
//
//  return result
//}

public func ChocolatesByNumberssolution(_ N : Int, _ M : Int) -> Int {
  N / gcd(N, b: M)
}

func gcd(_ a: Int, b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    return gcd(b, b: a % b)
  }
}

//public func solution(_ N : Int, _ M : Int) -> Int {
//  var arr: Set<Int> = []
//  var num = 0
//  while !arr.contains(num) {
//    arr.insert(num)
//    num = (num + M) % N
//  }
//  
//  return arr.count
//}
