

func reverse(x: Int) -> Int {
    
    var result = 0
    var copiedNumber = x
    if copiedNumber.addingReportingOverflow(0).overflow {
        return 0
    } else {
        while copiedNumber > 0 {
            result = result != 0 ? result * 10 : 0
            result += (copiedNumber % 10)
            copiedNumber = copiedNumber / 10
        }
        return result
    }
}



