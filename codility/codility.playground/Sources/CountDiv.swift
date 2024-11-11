//Write a function:
//
//public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int
//
//that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:
//
//{ i : A ≤ i ≤ B, i mod K = 0 }
//
//For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.
//
//Write an efficient algorithm for the following assumptions:
//
//A and B are integers within the range [0..2,000,000,000];
//K is an integer within the range [1..2,000,000,000];
//A ≤ B.

public func CountDivsolution2(_ A : Int, _ B : Int, _ K : Int) -> Int {
  let countB = B / K
  let countA = A / K - (A % K == 0 ? 1 : 0)
  
  return countB - countA
}

public func CountDivsolution(_ A : Int, _ B : Int, _ K : Int) -> Int {
  let bSum = B / K
  let aSum = A % K ==  0 ? (A / K - 1) : (A / K)
  return bSum - aSum
}
