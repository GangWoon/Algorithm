
import Foundation

func soultion(range: Int) -> Int {
    guard (1...12) ~= range else { return 1 }
    return (1...range).reduce(1) { $0 * $1 }
}

if let line = readLine() {
    print(soultion(range: Int(line) ?? 0))
}
