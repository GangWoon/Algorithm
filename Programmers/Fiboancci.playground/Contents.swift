import Foundation

// 피보나치 수
// 제한 사항 n은 1이상, 1000000이하인 자연수이다.

func fibo(_ a: Int, _ b: Int, _ n: Int) -> Int {
    guard n != 0 else { return a }
    return fibo(b, (a + b) % 1234567, n - 1)
}

func solution(_ n: Int) -> Int {
    return fibo(0, 1, n)
}

