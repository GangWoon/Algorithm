//A string S consisting of N characters is called properly nested if:
//
//S is empty;
//S has the form "(U)" where U is a properly nested string;
//S has the form "VW" where V and W are properly nested strings.
//For example, string "(()(())())" is properly nested but string "())" isn't.
//
//Write a function:
//
//public func solution(_ S : inout String) -> Int
//
//that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.
//
//For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..1,000,000];
//string S is made only of the characters '(' and/or ')'.



public func Nestingsolution2(_ S : inout String) -> Int {
  var stack = [Character]()
  for c in S {
    if c == "(" {
      stack.append(c)
    } else if c == ")" {
      if stack.isEmpty {
        return 0
      } else {
        stack.removeLast()
      }
    }
  }
  if !stack.isEmpty {
    return 0
  }
  
  return 1
}

public func Nestingsolution(_ S : inout String) -> Int {
  var arr: [Character] = []
  
  for char in S {
    if char == "(" {
      arr.append(char)
    } else { // char == )
      if arr.isEmpty {
        return 0
      } else {
        arr.removeLast()
      }
    }
  }
  
  return arr.isEmpty ? 1 :0
}
