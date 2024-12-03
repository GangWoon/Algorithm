# Algorithm List

## Sieve of Eratosthenes(에라토스테네스의 체)
체로 치듯이 수를 걸러내기 때문에 붙여진 이름.

N까지의 소수를 가장 빠르게 구할 수 있는 방법.

```swift
func eratosthenes(_ n: Int) -> [Bool] {
  var isPrime: [Bool] = Array(repeating: true, count: n + 1)
  isPrime[0] = false
  isPrime[1] = false
  
  for i in 2...Int(sqrt(Double(n))) {
    if isPrime[i] {
      // i * i 부터 시작하는 이유는, i보다 작은 값에 의해서 이미 제거 됨.
      // N log log N 시간 복잡도를 갖을 수 있는 핵심.
      for j in stride(from: i * i, through: n , by: i) {
        print(i, j)
        isPrime[j] = false
      }
    }
  }
  
  return isPrime
}
```

## Euclidean Algorithm(유클리드 호제법)
자연수 또는 정식의 최대공약수를 구하는 알고리즘

서로(互 호라고 읽음) 상대방 수를 나누어 결국 원하는 수를 얻는 알고리즘이다.

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
  let max = max(a, b)
  let min = min(a, b)
  
  let value = max % min
  if value == 0 {
    // 작은 수를 리턴해야함.
    return min
  }
  
  return gcd(min, value)
}
```
