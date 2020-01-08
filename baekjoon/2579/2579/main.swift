// Reference ID: woongs

if let input = readLine() {
    let n : Int = Int(input) ?? 0
    var a: [Int] = []
    for _ in 0 ..< n {
        a.append(Int(readLine()!) ?? 0)
    }
    
    var dp: (zero: Int, oneStep: Int, twoStep: Int) = (0, 0, 0)
    
    for i in 0 ..< n {
        let temp = dp.oneStep > dp.twoStep ? dp.oneStep : dp.twoStep
        dp.twoStep = dp.oneStep + a[i]
        dp.oneStep = dp.zero + a[i]
        dp.zero = temp
        print(dp)
    }
    print(dp.oneStep > dp.twoStep ? dp.oneStep : dp.twoStep)
}
