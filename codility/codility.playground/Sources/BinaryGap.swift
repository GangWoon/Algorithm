public func BinaryGapsolution(_ N : Int) -> Int {
  let binary = String(N, radix: 2)
  var result = 0
  var count = 0
  var insideGap = false
  
  
  for char in binary {
    if char == "1" {
      if insideGap {
        result = max(result, count)
      }
      insideGap = true
      count = 0
    } else if insideGap {
      count += 1
    }
  }

  return result
}
