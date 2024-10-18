/// 문제 풀때 카테고리부터 학습하고 풀기.
/// 

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
