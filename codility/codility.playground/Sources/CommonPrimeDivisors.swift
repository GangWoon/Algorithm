/// TODO: - 다시 풀기
///
/// 호제법인거 알고 접근했는데도 풀지 못함.
/// 수학적인 생각이 필요함. gcd를 사용한 후, 그 값을 사용해서 각 값을 gcd가 1이 나올 때 까지 나눈다.
/// 둘다 1일 경우, 증가시키도록 구현하면 되긴함.
///
///
public func CommonPrimeDivisorssolution(_ A : inout [Int], _ B : inout [Int]) -> Int {
  var count = 0
  for (a, b) in zip(A, B) {
    let gcd = gcd(a, b)
    let reducedA = removeCommonDivisors(num: a, g: gcd)
    let reducedB = removeCommonDivisors(num: b, g: gcd)
    if reducedA == 1, reducedB == 1 {
      count += 1
    }
  }
  
  return count
}

func removeCommonDivisors(num: Int, g: Int) -> Int {
  var n = num
  var currentGCD = g
  while currentGCD != 1 {
    n /= currentGCD
    currentGCD = gcd(n, g)
  }
  return n
}

func gcd(_ a: Int, _ b: Int) -> Int {
  let max = max(a, b)
  let min = min(a, b)
  let value = max % min
  if value == 0 {
    return min
  }
  
  return gcd(min, value)
}


//public func CommonPrimeDivisorssolution(_ A : inout [Int], _ B : inout [Int]) -> Int {
//  var count = 0
//  for (a,b) in zip(A, B) {
//    let value = gcd(a, b)
//    if checkSamePrimeDivisors(a, gcdValue: value) && checkSamePrimeDivisors(b, gcdValue: value) {
//      count += 1
//    }
//  }
//  
//  return count
//}
//
//func gcd(_ a: Int, _ b: Int) -> Int {
//  if b == 0 {
//    return a
//  } else {
//    return gcd(b, a % b)
//  }
//}
//
//func checkSamePrimeDivisors(_ n: Int, gcdValue: Int) -> Bool {
//  var n = n
//  while n != 1 {
//    let gcdN = gcd(n, gcdValue)
//    if gcdN == 1 {
//      return false
//    }
//    n /= gcdN
//  }
//  
//  return true
//}
