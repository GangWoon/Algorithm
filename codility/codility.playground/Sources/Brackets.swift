//A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:
//
//S is empty;
//S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
//S has the form "VW" where V and W are properly nested strings.
//For example, the string "{[()()]}" is properly nested but "([)()]" is not.
//
//Write a function:
//
//public func solution(_ S : inout String) -> Int
//
//that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.
//
//For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [0..200,000];
//string S is made only of the following characters: '(', '{', '[', ']', '}' and/or ')'.

public func Bracketssolution2(_ S : inout String) -> Int {
  var stack: [Character] = []
  for char in S {
    if char == "{" || char == "[" || char == "(" {
      stack.append(char)
    } else {
      guard let last = stack.last else { return 0 }
      if (char == "}" && last == "{")
          || (char == "]" && last == "[")
          || (char == ")" && last == "(") {
        stack.removeLast()
      } else {
        return 0
      }
    }
  }
  
  return stack.isEmpty ? 1 : 0
}

public func Bracketssolution(_ S : inout String) -> Int {
  var temp: [Character] = []
  
  for char in S {
    if char == "(" || char == "{" || char == "[" {
      temp.append(char)
    } else {
      if temp.isEmpty {
        return 0
      }
      
      if
        char == ")" && temp.last == "("
        || char == "]" && temp.last == "["
        || char == "}" && temp.last == "{"
      {
        temp.removeLast()
      } else {
        return 0
      }
    }
  }
  
  return temp.isEmpty ? 1 : 0
}
