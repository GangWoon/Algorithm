

if let tries = readLine() {
    let n = Int(tries) ?? 0
    let array: [Int] = readLine()?.split(separator: " ").map { Int($0) ?? 0 } ?? []
    var dp: [Int] = array
    

    for i in 1 ..< n {
        if dp[i] < dp[i - 1] + array[i] {
            dp[i] = dp[i - 1] + array[i]
        }
    }
    
    print(dp.max() ?? 0)
}


