//A DNA sequence can be represented as a string consisting of the letters A, C, G and T, which correspond to the types of successive nucleotides in the sequence. Each nucleotide has an impact factor, which is an integer. Nucleotides of types A, C, G and T have impact factors of 1, 2, 3 and 4, respectively. You are going to answer several queries of the form: What is the minimal impact factor of nucleotides contained in a particular part of the given DNA sequence?
//
//The DNA sequence is given as a non-empty string S = S[0]S[1]...S[N-1] consisting of N characters. There are M queries, which are given in non-empty arrays P and Q, each consisting of M integers. The K-th query (0 ≤ K < M) requires you to find the minimal impact factor of nucleotides contained in the DNA sequence between positions P[K] and Q[K] (inclusive).
//
//For example, consider string S = CAGCCTA and arrays P, Q such that:
//
//    P[0] = 2    Q[0] = 4
//    P[1] = 5    Q[1] = 5
//    P[2] = 0    Q[2] = 6
//The answers to these M = 3 queries are as follows:
//
//The part of the DNA between positions 2 and 4 contains nucleotides G and C (twice), whose impact factors are 3 and 2 respectively, so the answer is 2.
//The part between positions 5 and 5 contains a single nucleotide T, whose impact factor is 4, so the answer is 4.
//The part between positions 0 and 6 (the whole string) contains all nucleotides, in particular nucleotide A whose impact factor is 1, so the answer is 1.
//Write a function:
//
//public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
//
//that, given a non-empty string S consisting of N characters and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M integers specifying the consecutive answers to all queries.
//
//Result array should be returned as an array of integers.
//
//For example, given the string S = CAGCCTA and arrays P, Q such that:
//
//    P[0] = 2    Q[0] = 4
//    P[1] = 5    Q[1] = 5
//    P[2] = 0    Q[2] = 6
//the function should return the values [2, 4, 1], as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//M is an integer within the range [1..50,000];
//each element of arrays P and Q is an integer within the range [0..N - 1];
//P[K] ≤ Q[K], where 0 ≤ K < M;
//string S consists only of upper-case English letters A, C, G, T.

///
///MARK: - 이해가 되지 않음 나중에 다시 풀면 좋을듯

/// index 생각하는거 더 디테일하게 접근하기
/// prefixsum 생각해보기
public func GenomicRangeQuerysolution2(
  _ S : inout String,
  _ P : inout [Int],
  _ Q : inout [Int]
) -> [Int] {
  var prefixA: [Int] = .init(repeating: 0, count: S.count + 1)
  var prefixC: [Int] = .init(repeating: 0, count: S.count + 1)
  var prefixG: [Int] = .init(repeating: 0, count: S.count + 1)
  
  for (i, ele) in S.enumerated() {
    prefixA[i + 1] = prefixA[i]
    prefixC[i + 1] = prefixC[i]
    prefixG[i + 1] = prefixG[i]
    
    if ele == "A" {
      prefixA[i + 1] += 1
    } else if ele == "C" {
      prefixC[i + 1] += 1
    } else if ele == "G" {
      prefixG[i + 1] += 1
    }
  }
  
  var result: [Int] = []
  for i in 0..<P.count {
    let left = P[i] + 1
    let right = Q[i] + 1
    
    if prefixA[right] - prefixA[left - 1] > 0 {
      result.append(1)
    } else if prefixC[right] - prefixC[left - 1] > 0 {
      result.append(2)
    } else if prefixG[right] - prefixG[left - 1] > 0 {
      result.append(3)
    } else {
      result.append(4)
    }
  }
  
  return result
}

//public func solution(
//  _ S : inout String,
//  _ P : inout [Int],
//  _ Q : inout [Int]
//) -> [Int] {
//  var prefixA: [Int] = .init(repeating: 0, count: S.count)
//  var prefixC: [Int] = .init(repeating: 0, count: S.count)
//  var prefixG: [Int] = .init(repeating: 0, count: S.count)
//
//  for (i, ele) in Array(S).enumerated() {
//    if i != 0 {
//      prefixA[i] = prefixA[i - 1]
//      prefixC[i] = prefixC[i - 1]
//      prefixG[i] = prefixG[i - 1]
//    }
//
//    if ele == "A" {
//      prefixA[i] += 1
//    } else if ele == "C" {
//      prefixC[i] += 1
//    } else if ele == "G" {
//      prefixG[i] += 1
//    }
//  }
//
//  var result: [Int] = []
//  for i in 0..<P.count {
//    let left = P[i]
//    let right = Q[i]
//    if prefixA[right] - prefixA[left] > 0 {
//      result.append(1)
//    } else if prefixC[right] - prefixC[left] > 0 {
//      result.append(2)
//    } else if prefixG[right] - prefixG[left] > 0 {
//      result.append(3)
//    } else {
//      result.append(4)
//    }
//  }
//
//  return result
//}

//public func solution(
//  _ S : inout String,
//  _ P : inout [Int],
//  _ Q : inout [Int]
//) -> [Int] {
//  var arr = Array(S)
//  var result: [Int] = []
//  let N = P.count
//
//  for i in 0..<N {
//    var min = 4
//    var copy = P[i]
//    while copy <= Q[i] {
//      let value = arr[copy]
//      if value == "A" {
//        min = 1
//        result.append(1)
//        break
//      } else if value == "C" {
//        min = 2
//      } else if value == "G" {
//        min = 3
//      }
//      copy += 1
//    }
//    if min != 1 {
//      result.append(min)
//    }
//  }
//
//  return result
//}

public func GenomicRangeQuerysolution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
  let N = S.count
  var a: [Int] = .init(repeating: 0, count: N + 1)
  var c: [Int] = .init(repeating: 0, count: N + 1)
  var g: [Int] = .init(repeating: 0, count: N + 1)
  
  for i in 0..<N {
    let index = S.index(S.startIndex, offsetBy: i)
    let str = S[index]
    a[i + 1] = a[i] + (str == "A" ? 1 : 0)
    c[i + 1] = c[i] + (str == "C" ? 1 : 0)
    g[i + 1] = g[i] + (str == "G" ? 1 : 0)
  }
  
  var result: [Int] = []
  
  for i in 0..<P.count {
    let start = P[i]
    let end = Q[i] + 1
    if a[end] - a[start] > 0 {
      result.append(1)
    } else if c[end] - c[start] > 0 {
      result.append(2)
    } else if g[end] - g[start] > 0 {
      result.append(3)
    } else {
      result.append(4)
    }
  }
  
  
  return result
}
