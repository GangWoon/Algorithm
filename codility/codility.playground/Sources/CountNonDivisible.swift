/// 역으로도 생각해보기
/// 내가 접근한 방법은 소수 배열을 생성해서 다시 조회하는 방식으로 풀었음.
/// 하지만 filter와 contains 를 같이 쓰면 n^2으로 늘어난다는 점을 잊지 않기 왠만하면 사용하지 말기.
///
/// 정답은 빈도수를 저장하고 그 수를 갖고 현재 배열에서 포함시킨 소수의 수를 저장하게 됨
/// 그리고 마지막에 길이에서 빼서 값을 구하는 형태로. 이건 사실 다시 풀라해도 생각하기 어려울 듯? 화이팅

public func CountNonDivisiblesolution(_ A : inout [Int]) -> [Int] {
  let n = A.count
  var frequency: [Int: Int] = [:]
  var maxElement = 0

  for num in A {
    frequency[num, default: 0] += 1
    maxElement = max(maxElement, num)
  }
  var divisorsCount: [Int: Int] = [:]
  
  for num in frequency.keys {
    var sum = 0
    var i = 1
    while i * i <= num {
      if num % i == 0 {
        sum += frequency[i, default: 0]
        if i != num / i {
          sum += frequency[num / i, default: 0]
        }
      }
      i += 1
    }
    divisorsCount[num] = sum
  }
  
  return A.map { n - divisorsCount[$0]! }
}

//public func solution(_ A : inout [Int]) -> [Int] {
//  var setA = Set(A)
//  var values: [Int: [Int]] = [:]
//
//  for value in setA {
//    let a = Int(Double(value).squareRoot())
//    var arr: [Int] = []
//    for ele in 1...a {
//      arr.append(ele)
//      if ele * ele != value {
//        arr.append(value / ele)
//      }
//    }
//    values[value] = arr
//  }
//
//  var values2: [Int: Int] = [:]
//
//  for value in setA {
//    let arr = values[value]!
//    let ele = A.filter { !arr.contains($0) }.count
//    values2[value] = ele
//  }
//
//  return A.compactMap { values2[$0] }
//}
