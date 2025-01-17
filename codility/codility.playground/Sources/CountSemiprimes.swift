import Foundation
/// 66 / 100
//A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.
//
//A semiprime is a natural number that is the product of two (not necessarily distinct) prime numbers. The first few semiprimes are 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.
//
//You are given two non-empty arrays P and Q, each consisting of M integers. These arrays represent queries about the number of semiprimes within specified ranges.
//
//Query K requires you to find the number of semiprimes within the range (P[K], Q[K]), where 1 ≤ P[K] ≤ Q[K] ≤ N.
//
//For example, consider an integer N = 26 and arrays P, Q such that:
//
//    P[0] = 1    Q[0] = 26
//    P[1] = 4    Q[1] = 10
//    P[2] = 16   Q[2] = 20
//The number of semiprimes within each of these ranges is as follows:
//
//(1, 26) is 10,
//(4, 10) is 4,
//(16, 20) is 0.
//Write a function:
//
//public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
//
//that, given an integer N and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M elements specifying the consecutive answers to all the queries.
//
//For example, given an integer N = 26 and arrays P, Q such that:
//
//    P[0] = 1    Q[0] = 26
//    P[1] = 4    Q[1] = 10
//    P[2] = 16   Q[2] = 20
//the function should return the values [10, 4, 0], as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..50,000];
//M is an integer within the range [1..30,000];
//each element of arrays P and Q is an integer within the range [1..N];
//P[i] ≤ Q[i].

/// 에라토스테네스의 체를 사용해서 N까지의 소수를 n log log n의 시간으로 구할 수 있다.
///  1. N + 1의 배열을 true로 생성
///  2. 0, 1은 소수가 아니기 때문에 false로 초기화 시켜준다. arr[0], arr[1] = false
///  3. 2부터 루트 n까지 순회하면서 배수를 모두 false로 바꿔준다.
///
///  세미 프라임을 계산할 때, 소수만 계산하게 구현(개선점) -> NlogN 보다 작다.
///  내가 작성한 코드는 N^2까지 비교를하게 됨. 왜냐하면 루트 x까지 매번 반복하기 때문. break를 하는것도 중요하지만 계산을 줄일 수 있는 방법을 찾아야함.
public func CountSemiprimessolution2(_ N: Int, _ P: inout [Int], _ Q: inout [Int]) -> [Int] {
  if N < 4 {
      return [Int](repeating: 0, count: P.count)
  }
  
  var isPrime: [Bool] = .init(repeating: true, count: N + 1)
  isPrime[0] = false
  isPrime[1] = false
  
  for i in 2...Int(sqrt(Double(N))) {
    if isPrime[i] {
      for j in stride(from: i * i, through: N, by: i) {
        isPrime[j] = false
      }
    }
  }
  
  var isSemiprime = [Int](repeating: 0, count: N + 1)
  for i in 2...N {
    if isPrime[i] {
      for j in i...N where isPrime[j] {
        if i * j > N {
          break
        }
        isSemiprime[i * j] = 1
      }
    }
  }
  
  var semiprimePrefixSum = [Int](repeating: 0, count: N + 1)
  for i in 1...N {
    semiprimePrefixSum[i] = semiprimePrefixSum[i - 1] + isSemiprime[i]
  }
  
  return zip(P, Q)
    .map { semiprimePrefixSum[$1] - semiprimePrefixSum[$0 - 1] }
}


//func divisors(_ n: Int) -> [Int] {
//  let value = Int(Double(n).squareRoot())
//  var result: [Int] = []
//  for i in 1...value {
//    if n % i == 0 {
//      result.append(i)
//      if i * i != n {
//        result.append(n / i)
//      }
//    }
//  }
//  return result.sorted()
//}
//
//public func solution(
//  _ N : Int,
//  _ P : inout [Int],
//  _ Q : inout [Int]
//) -> [Int] {
//
//  var primes: [Int] = .init(repeating: 0, count: N + 1)
//  var x = 2
//
//  while x <= N {
//    var flag = false
//    for i in 1...Int(Double(x).squareRoot()) {
//      if x % i == 0, i != 1 {
//        flag = true
//        break
//      }
//    }
//    if !flag {
//      primes[x] = 1
//    }
//    x += 1
//  }
//
//  var y = 4
//  var semiPrimes: [Int] = .init(repeating: 0, count: N + 1)
//
//  while y <= N {
//    semiPrimes[y] = semiPrimes[y - 1]
//    var flag = false
//    let items = divisors(y)
//    for item in items where item != 1 && item != y {
//      if primes[item] == 1 {
//      } else {
//        flag = true
//        break
//      }
//    }
//
//    if !flag, items.count != 2 {
//      semiPrimes[y] += 1
//    }
//
//    y += 1
//  }
//
//  for (index, item) in semiPrimes.enumerated() {
//    print(index, item)
//  }
//
//
//
//  return zip(P, Q)
//    .map { semiPrimes[$1] - semiPrimes[$0 - 1] }
//}



/// 내가 푼 방법:
/// 범위를 순회하며, semiprime인지 아닌지 확인하기
/// 맞으면 += 1
/// 비어있을 경우, 1과 자신을 제외한 약수를 구해서 약수들이 prime인지 확인하기
/// 다시 비교
///
/// GPT 답변
/// 범위가 나오면, 그 범위를 순회할 생각을 하면 안됨.
/// 범위가 나올경우, i 까지의 총합을 계산하고 끝 부분 - 처음 부분으로 그 사이 범위의 합을 구해야함.
///
/// 그리고 prime의 실제 값을 구해야할 경우, 에라토스테네스의 체로 구하는게 가장 빠르다고 함.
/// ex) 2가 prime이라면, 2의 배수 모두 prime이 아님.
///
/// ---
///
/// 범위에 대해서 항상 생각해보기 잘모르겠으면, 일단 범위를 보고 외우자.
/// BF방식은 매우 비효율적이다.
/// 누적합을 해결할 경우,  O(1)로 해결할 수 있음. 범위가 나온다면 잊지 마고 누적합 방식에 대해서 생각해보기.

public func CountSemiprimessolution(_ N: Int, _ P: inout [Int], _ Q: inout [Int]) -> [Int] {
  var isPrime = [Bool](repeating: true, count: N + 1)
  isPrime[0] = false
  isPrime[1] = false
  for i in 2...N {
    if isPrime[i] {
      var multiple = 2 * i
      while multiple <= N {
        isPrime[multiple] = false
        multiple += i
      }
    }
  }
  
  var isSemiPrime = [Int](repeating: 0, count: N + 1)
  let primes = (2...N).filter { isPrime[$0] }
  for i in primes {
    for j in primes {
      let semiPrime = i * j
      if semiPrime > N { break }
      isSemiPrime[semiPrime] = 1
    }
  }
  
  var semiPrimeCount = [Int](repeating: 0, count: N + 1)
  for i in 1...N {
    semiPrimeCount[i] = semiPrimeCount[i - 1] + isSemiPrime[i]
  }
  
  var result: [Int] = []
  for k in 0..<P.count {
    let start = P[k]
    let end = Q[k]
    result.append(semiPrimeCount[end] - semiPrimeCount[start - 1])
  }
  
  return result
}

//public func solution(
//  _ N : Int,
//  _ P : inout [Int],
//  _ Q : inout [Int]
//) -> [Int] {
//  let ranges = zip(P, Q).map { $0...$1 }
//
//  var dict: [Int: Bool] = [:]
//  var result: [Int] = []
//
//  for range in ranges {
//    var count = 0
//    for ele in range {
//      if let flag = dict[ele] {
//        if flag { count += 1 }
//      } else {
//        var flag = false
//        for item in divide(ele) {
//          if !isPrime(item) {
//            flag = false
//            break
//          } else {
//            flag = true
//          }
//        }
//
//        dict[ele] = flag
//        if flag {
//          count += 1
//        }
//      }
//
//    }
//    result.append(count)
//  }
//
//  return result
//}
//
//func divide(_ n: Int) -> [Int] {
//  var sqrtN = Int(sqrt(Double(n)))
//  var result: Set<Int> = []
//  for i in 1...sqrtN {
//    if i == 1 { continue }
//    if n % i == 0 {
//      result.insert(i)
//      result.insert(n / i)
//    }
//  }
//
//  return Array(result)
//}
//
//func isPrime(_ n: Int) -> Bool {
//  var sqrtN = Int(sqrt(Double(n)))
//  for i in 1...sqrtN {
//    if i == 1 { continue }
//    if n % i == 0 { return false }
//  }
//  return true
//}
