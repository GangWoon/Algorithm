import Foundation

//A positive integer D is a factor of a positive integer N if there exists an integer M such that N = D * M.
//
//For example, 6 is a factor of 24, because M = 4 satisfies the above condition (24 = 6 * 4).
//
//Write a function:
//
//public func solution(_ N : Int) -> Int
//
//that, given a positive integer N, returns the number of its factors.
//
//For example, given N = 24, the function should return 8, because 24 has 8 factors, namely 1, 2, 3, 4, 6, 8, 12, 24. There are no other factors of 24.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..2,147,483,647].

public func CountFactorssolution2(_ N : Int) -> Int {

  let value = Int(sqrt(Double(N)))
  
  var result = 0
  
  for i in 1...value {
    if N % i == 0 {
      print(i)
      result += 1
    }
  }
  
  return (result * 2) + (value * value == N ? -1 : 0)
}

public func CountFactorssolution(_ N : Int) -> Int {
  let value = Int(sqrt(Double(N)))
  var count = 0
  
  for i in 1...value {
    if N % i == 0 {
      count += 2
      
      if value * value == N {
        count -= 1
      }
    }
  }
  
  return count
}
