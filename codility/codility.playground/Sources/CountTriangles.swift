///규칙은
///A[P] + A[Q] > A[R]
///A[Q] + A[R] > A[P]
///A[R] + A[P] > A[Q]
///

///범위
///A.count ~= 0...1000
/// 0 < ele < 1_000_000_000
/// 배열을 받고나서, 3개 요소를 뽑을 수 있는 지 판별해야함.
///
///
/// 생각
/// 조합의 인덱스를 따지는게 아니니까 정렬을해도 문제가 없어보임.
///
/// 정렬을하게 되면 이득이 있을까? 의미가 있음. 정렬이 됐기 때문에 left, right로 접근이 가능해짐.
/// 슬라이딩을 써야할 거 같음.
///
/// 정렬하게 되면 P < Q < R 순서로 배치된다.  A[P] + A[Q] > A[R]만 확인하면 된다. <- 여기까지 알아냄
/// 역으로 접근해서 풀어야지 효율적일 거 같았음. <- 이 부분부터 설계를 못했음.

public func CountTrianglessolution2(_ A : inout [Int]) -> Int {
  A.sort()
  let N = A.count
  var count = 0
  
  for R in stride(from: N - 1, through: 2, by: -1) {
    var P = 0
    var Q = R - 1
    
    while P < Q {
      if A[P] + A[Q] > A[R] {
        count += Q - P
        Q -= 1
      } else {
        P += 1
      }
    }
  }
  
  return count
}

public func CountTrianglessolution(_ A: inout [Int]) -> Int {
  let N = A.count
  if N < 3 {
    return 0
  }
  
  A.sort()
  var result = 0
  
  for i in 0 ..< N - 2 {
    var k = i + 2
    for j in i + 1 ..< N - 1 {
      while k < N && A[i] + A[j] > A[k] {
        k += 1
      }
      result += k - j - 1
    }
  }
  
  return result
}

//public func solution(_ A: inout [Int]) -> Int {
//  A.sort()
//
//  var i = 0
//  var j = 1
//  var k = 2
//
//  var result = 0
//
//  while i != A.count && j != A.count && k != A.count {
//    print(i, j, k)
//    if A[i] + A[j] > A[k] {
//      result += 1
//      if k == A.count - 1 {
//        if j == A.count - 2 {
//          if i == A.count - 3 {
//            break
//          } else {
//            i += 1
//          }
//        } else {
//          j += 1
//        }
//
//      } else {
//        k += 1
//      }
//    } else {
//      if j == A.count - 2 {
//        i += 1
//        j = i + 1
//      } else {
//        j += 1
//      }
//      k = j + 1
//    }
//  }
//
//
//  return result
//}
