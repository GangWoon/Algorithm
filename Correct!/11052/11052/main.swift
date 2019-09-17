
import Foundation

let count: Int = Int(readLine()!)!
let prices = readLine()?.split(separator: " ")
var price: [Int] = [0]

for a in prices! {
    let b = Int(a)!
    price.append(b)
}

for i in 1 ... count {
    for j in 1 ... i {
        price[i] = max(price[i], price[i - j] + price[j])
    }
}

print(price.last!)


