import Foundation
//A non-empty array A consisting of N integers is given.
//
//A peak is an array element which is larger than its neighbors. More precisely, it is an index P such that 0 < P < N − 1,  A[P − 1] < A[P] and A[P] > A[P + 1].
//
//For example, the following array A:
//
//    A[0] = 1
//    A[1] = 2
//    A[2] = 3
//    A[3] = 4
//    A[4] = 3
//    A[5] = 4
//    A[6] = 1
//    A[7] = 2
//    A[8] = 3
//    A[9] = 4
//    A[10] = 6
//    A[11] = 2
//has exactly three peaks: 3, 5, 10.
//
//We want to divide this array into blocks containing the same number of elements. More precisely, we want to choose a number K that will yield the following blocks:
//
//A[0], A[1], ..., A[K − 1],
//A[K], A[K + 1], ..., A[2K − 1],
//...
//A[N − K], A[N − K + 1], ..., A[N − 1].
//What's more, every block should contain at least one peak. Notice that extreme elements of the blocks (for example A[K − 1] or A[K]) can also be peaks, but only if they have both neighbors (including one in an adjacent blocks).
//
//The goal is to find the maximum number of blocks into which the array A can be divided.
//
//Array A can be divided into blocks as follows:
//
//one block (1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2). This block contains three peaks.
//two blocks (1, 2, 3, 4, 3, 4) and (1, 2, 3, 4, 6, 2). Every block has a peak.
//three blocks (1, 2, 3, 4), (3, 4, 1, 2), (3, 4, 6, 2). Every block has a peak. Notice in particular that the first block (1, 2, 3, 4) has a peak at A[3], because A[2] < A[3] > A[4], even though A[4] is in the adjacent block.
//However, array A cannot be divided into four blocks, (1, 2, 3), (4, 3, 4), (1, 2, 3) and (4, 6, 2), because the (1, 2, 3) blocks do not contain a peak. Notice in particular that the (4, 3, 4) block contains two peaks: A[3] and A[5].
//
//The maximum number of blocks that array A can be divided into is three.
//
//Write a function:
//
//public func solution(_ A : inout [Int]) -> Int
//
//that, given a non-empty array A consisting of N integers, returns the maximum number of blocks into which A can be divided.
//
//If A cannot be divided into some number of blocks, the function should return 0.
//
//For example, given:
//
//    A[0] = 1
//    A[1] = 2
//    A[2] = 3
//    A[3] = 4
//    A[4] = 3
//    A[5] = 4
//    A[6] = 1
//    A[7] = 2
//    A[8] = 3
//    A[9] = 4
//    A[10] = 6
//    A[11] = 2
//the function should return 3, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//each element of array A is an integer within the range [0..1,000,000,000].

//MARK: - 다시풀기
/// 1. 범위 제대로 체크하기
/// 2. 가장 큰 값을 찾는거면 큰값부터 비교하기
/// 3. 범위를 체크하는 방법을 여러 방면으로 생각해보기

/// -> 그래도 처음보다는 문제 접근을 잘함 굿 :)
/// 필요한거에 따라서 문제를 순차적으로 작게 설계하기

public func Peakssolution2(_ A : inout [Int]) -> Int {
  let n = A.count
  if n < 3 { return 0 }
  
  var peaks: [Int] = []
  for i in 1..<n-1 {
    if A[i] > A[i-1] && A[i] > A[i+1] {
      peaks.append(i)
    }
  }
  if peaks.isEmpty { return 0 }

  func getDivisors(_ num: Int) -> [Int] {
    var divisors: [Int] = []
    for i in 1...Int(Double(num).squareRoot()) {
      if num % i == 0 {
        divisors.append(i)
        if i != num / i {
          divisors.append(num / i)
        }
      }
    }
    return divisors.sorted()
  }
  let divisors = getDivisors(n)
  for k in divisors.reversed() {
    let blockSize = n / k
    var blockCount = 0
    var peakIndex = 0
    
    for i in 0..<k {
      let start = i * blockSize
      let end = (i + 1) * blockSize - 1
      while peakIndex < peaks.count && peaks[peakIndex] <= end {
        if peaks[peakIndex] >= start {
          blockCount += 1
          break
        }
        peakIndex += 1
      }
    }
    
    if blockCount == k {
      return k
    }
  }

  return 0
}

public func Peakssolution(_ A : inout [Int]) -> Int {
  let N = A.count
  if N < 3 {
    return 0
  }
  
  let sqrtN = Int(sqrt(Double(N)))
  var divisors: Set<Int> = []
  
  for value in 1...sqrtN {
    if N % value == 0 {
      divisors.insert(value)
      divisors.insert(N / value)
    }
  }
  
  let sortedDivisors = divisors.sorted()
  var peakIndices: [Int] = []
  
  for i in 1..<A.count - 1 {
    if A[i] > A[i - 1], A[i] > A[i + 1] {
      peakIndices.append(i)
    }
  }
  
  if peakIndices.isEmpty {
    return 0
  }
  
  for blockCount in sortedDivisors.reversed() {
    if canDivideIntoBlocks(A, peakIndices, blockCount) {
      return blockCount
    }
  }
  
  return 0
}

func canDivideIntoBlocks(_ A: [Int], _ peakIndicies: [Int], _ blockCount: Int) -> Bool {
  let blockSize = A.count / blockCount
  var blockHasPeak = Array(repeating: false, count: blockCount)
  
  for peakIndex in peakIndicies {
    let blockIndex = peakIndex / blockSize
    blockHasPeak[blockIndex] = true
  }
  
  for hasPeak in blockHasPeak {
    if !hasPeak {
      return false
    }
  }
  
  return true
}

func canDivide(_ A: [Int], _ K: Int) -> Bool {
  var peaks: [Int] = []
  for i in 1..<A.count - 1 {
    if A[i] > A[i - 1], A[i] > A[i + 1] {
      peaks.append(i)
    }
  }
  if peaks.isEmpty {
    return false
  }
  
  let length = A.count / K
  var ranges: [Range<Int>] = []
  for i in 0..<K {
    ranges.append(i * length..<length * (i + 1))
  }
  
  for peak in peaks {
    for range in ranges {
      if range.contains(peak) {
        let index = ranges.firstIndex(of: range)!
        ranges.remove(at: index)
      }
    }
  }
  
  return ranges.isEmpty
}
