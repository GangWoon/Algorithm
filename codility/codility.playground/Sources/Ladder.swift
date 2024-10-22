/// << n: shift연산은 2진수의 값을 n만큼 왼쪽으로 당기는 연산
/// 그렇기 때문에 2^n의 값의 경우, 1 << n으로 사용할 수 있음.
/// 최소값이나, 최대값에서 문제가 발생하는지 확인하기.
/// n + 1, n + 2 혹은 n - 1, n - 2의 경우 피보나치로 풀어야하는 문제이라는걸 눈치채야함.
///

public func Laddersolution(_ A : inout [Int], _ B : inout [Int]) -> [Int] {
  let maxN = A.max()!
  let maxPower = B.max()!
  var fibonacci: [Int] = Array(repeating: 0, count: maxN + 1)
  fibonacci[0] = 1
  fibonacci[1] = 1
  if maxN > 1 {
    fibonacci[2] = 2
  }
  
  let maxMod = 1 << maxPower
  if maxN > 2 {
    for i in 2...maxN {
      fibonacci[i] = (fibonacci[i - 1] + fibonacci[i - 2]) % maxMod
    }
  }
  
  var result: [Int] = []
  for (i, j) in zip(A, B) {
    let mod = 1 << j
    result.append(fibonacci[i] % mod)
  }
  
  return result
}
