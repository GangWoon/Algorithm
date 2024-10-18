import Foundation

var a = [1, 4, 16]
var b = [26, 10, 20]


public func solution(_ N : Int, _ M : Int) -> Int {
  var arr: Set<Int> = []
  var num = 0
  while !arr.contains(num) {
    arr.insert(num)
    num = (num + M) % N
  }
  
  return arr.count
}

func gcd(_ a: Int, b: Int) -> Int {
  if b == 0 {
    return a
  } else {
    gcd
  }
}

solution(10, 4)
