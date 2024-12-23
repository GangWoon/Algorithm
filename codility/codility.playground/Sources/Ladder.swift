/// 1. shift 연산의 경우 x << y는 십진수 x를 y만큼 비트를 왼쪽으로 넘기는 걸 뜻한다.
/// 2. 피보나치 수열 처럼, 2^의 경우 매번 계산하기 부담스럽다.
/// 그렇기 때문에 가장 큰 수를 구하고 이 수로 나눈 값을 저장시킨다.

public func Laddersolution2(
  _ A : inout [Int],
  _ B : inout [Int]
) -> [Int] {
  let max = A.max()!
  let mod = 1 << 30 /// B.max가 더 좋은 방향인거 같다. 매번 계산하는게 비효율적인거지 가장 큰 값을 계산할 필요는 없음.
  var dict = [Int](repeating: 0, count: max + 1)
  dict[1] = 1
  dict[0] = 1
  
  if max > 1 {
    for ele in 2...max {
      dict[ele] = (dict[ele - 1] + dict[ele - 2]) % mod
    }
  }
  
  return zip(A, B)
    .map { dict[$0] % 1 << $1 }
}

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
