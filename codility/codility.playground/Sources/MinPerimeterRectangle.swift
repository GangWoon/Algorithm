import Foundation
//An integer N is given, representing the area of some rectangle.
//
//The area of a rectangle whose sides are of length A and B is A * B, and the perimeter is 2 * (A + B).
//
//The goal is to find the minimal perimeter of any rectangle whose area equals N. The sides of this rectangle should be only integers.
//
//For example, given integer N = 30, rectangles of area 30 are:
//
//(1, 30), with a perimeter of 62,
//(2, 15), with a perimeter of 34,
//(3, 10), with a perimeter of 26,
//(5, 6), with a perimeter of 22.
//Write a function:
//
//public func solution(_ N : Int) -> Int
//
//that, given an integer N, returns the minimal perimeter of any rectangle whose area is exactly equal to N.
//
//For example, given an integer N = 30, the function should return 22, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..1,000,000,000].

/// 알고리즘 문제 풀때는 얕은 수학 지식을 들고오지 않기.
/// 확실하게 문제풀기.

public func MinPerimeterRectanglesolution(_ N : Int) -> Int {
    let sqrtN = Int(sqrt(Double(N)))
    var minPerimeter = Int.max

    for i in 1...sqrtN {
        if N % i == 0 {
            let sideA = i
            let sideB = N / i
            let perimeter = 2 * (sideA + sideB)
            minPerimeter = min(minPerimeter, perimeter)
        }
    }

    return minPerimeter
}
