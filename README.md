# Algorithm List

## Sieve of Eratosthenes(에라토스테네스의 체)
체로 치듯이 수를 걸러내기 때문에 붙여진 이름.

N까지의 소수를 가장 빠르게 구할 수 있는 방법.

```swift
func eratosthenes(_ n: Int) -> [Bool] {
  var isPrime: [Bool] = Array(repeating: true, count: n + 1)
  isPrime[0] = false
  isPrime[1] = false
  
  for i in 2...Int(sqrt(Double(n))) {
    if isPrime[i] {
      // i * i 부터 시작하는 이유는, i보다 작은 값에 의해서 이미 제거 됨.
      // N log log N 시간 복잡도를 갖을 수 있는 핵심.
      for j in stride(from: i * i, through: n , by: i) {
        print(i, j)
        isPrime[j] = false
      }
    }
  }
  
  return isPrime
}
```

## Euclidean Algorithm(유클리드 호제법)
자연수 또는 정식의 최대공약수를 구하는 알고리즘

서로(互 호라고 읽음) 상대방 수를 나누어 결국 원하는 수를 얻는 알고리즘이다.

```swift
func gcd(_ a: Int, _ b: Int) -> Int {
  let max = max(a, b)
  let min = min(a, b)
  
  let value = max % min
  if value == 0 {
    // 작은 수를 리턴해야함.
    return min
  }
  
  return gcd(min, value)
}
```

## BFS[Breadth-First Search](너비 우선 탐색)
![image](https://github.com/user-attachments/assets/a6793830-b31b-4647-ac8d-b550632eb1a5)
시작 노드에서 가까운 노드부터 탐색한 뒤, 점차 멀리있는 노드로 진행합니다.
(아래 [1, 2]의 경우, 그림을 보면 이해가 됩니다. 3번은 외우기) 

### 특징
1. 레벨 기반 탐색
시작 노드에서 특정 거리에 있는 모든 노드를 탐색한 뒤, 다음 레벨에 있는 노드로 넘어간다.

2. 큐 사용
탐색할 노드들을 순서대로 저장하고 FIFO방식으로 처리한다.

3. 최단 경로 보장
가중치가 없는 그래프의 경우 최단 경로를 보장 

### 동작 과정
1. 초기화
시작 노드를 큐에 추가
방문한 노드를 기록하기 위해서 Set을 사용하기([Bool]을 사용할 수도 있지만, 공간 복잡도를 생각해보면 Set이 더 좋은 접근인거 같습니다.)
2. 탐색 진행
큐에서 노드를 꺼내서, 현재 노드에서 연결된 노드를 탐색
아직 방문하지 않는 이웃 노드의 경우 큐에 추가, 방문 여부 기록하기

3. 종료 조건
큐가 비어있을 경우, 목표 노드에 도달할 경우
```
BFS(graph, start):
    initialize queue with start
    initialize visited as an empty set
    add start to visited
    
    while queue is not empty:
        initialize nextQueue as empty
        
        for node in queue:
            process(node)
            
            for neighbor in graph.neighbors(node):
                if neighbor is not in visited:
                    add neighbor to visited
                    add neighbor to nextQueue
        
        queue = nextQueue
```

### 활용 사례
1. 최단 경로 탐색
가중치가 없는 그래프의 경우 ex) 미로 찾기(2D 그리드 탐색), 네트워크 거리 계산, 레벨 탐색

2. 그래프의 연결성 확인
연결 그래프인지 확인하거나, 연결 요소의 개수를 찾을 때 사용

3. Flood Fill 알고리즘 <- TODO: 나중에 공부하기
그림판 색 채우기와 같은 문제(물이 퍼지는 시뮬레이션) 

## Binary Search
"정렬된 배열"에서 원하는 값을 빠르게 찾기 위한 알고리즘입니다. 배열의 중간 값을 기준으로 탐색 범위를 절반씩 줄이는 방식으로 동작하며, 시간 복잡도는  O(log N)입니다.

left, right을 기준으로 mid(left + right / 2)로 설정합니다.

target값과 arr[mid] 값을 비교합니다.
arr[mid] == target 이면 값을 찾음.
arr[mid] < target -> left = mid + 1
arr[mid] > target -> right = mid - 1 로 설정

left > right가 되면 탐색 종료, 원하는 값을 찾지 못했다면 실패로 간주

Binary Search가 어려운 이유는 "탐색 범위"와 "조건" 정의
이진 탐색은 단순한 값을 찾는 것이 아니라 조건에 맞는 최소/최대를 찾는 경우가 많습니다. <- 문제의 본질을 잘못 이해하면 올바른 설계가 불가능.
결론: 많이 더 풀어보고 감을 잡아야할 거 같습니다;;.
 
