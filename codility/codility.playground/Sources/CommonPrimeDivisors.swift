/// TODO: - 다시 풀기

public func CommonPrimeDivisorssolution(_ A : inout [Int], _ B : inout [Int]) -> Int {
  var count = 0
  for (a,b) in zip(A, B) {
    let value = gcd(a, b)
    if checkSamePrimeDivisors(a, gcdValue: value) && checkSamePrimeDivisors(b, gcdValue: value) {
      count += 1
    }
  }
  
  return count
}

func gcd(_ a: Int, _ b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    return gcd(b, a % b)
  }
}

func checkSamePrimeDivisors(_ n: Int, gcdValue: Int) -> Bool {
  var n = n
  while n != 1 {
    let gcdN = gcd(n, gcdValue)
    if gcdN == 1 {
      return false
    }
    n /= gcdN
  }
  
  return true
}
