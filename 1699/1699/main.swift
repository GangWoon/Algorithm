

if let input = readLine() {
    let n = Int(input) ?? 0
    var dp: [Int] = Array(repeating: 0, count: n + 1)
    
    for i in 1 ... n{
        dp[i] = i
        let rootI = Int(Double(i).squareRoot())
        for j in 1 ... rootI {
            let expj = j * j
            dp[i] = dp[i] > dp[i - expj] + 1 ? dp[i - expj] + 1 : dp[i]
        }
    }
    print(dp[n])
    print(dp)
}
