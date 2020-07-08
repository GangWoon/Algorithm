
// Truck Passing A Bridge
// 트럭을 입력받은 순서대로 대입했어야 했는데 문제를 잘 못 읽고 최단 시간 순으로 변경해서 풀다가 문제를 다시 확인하고 풀음

import Foundation

class Truck {
    
    var isPassed: Bool {
        drivingTime >= remainingTime
    }
    let weight: Int
    var drivingTime: Int = 1
    var remainingTime: Int
    
    init(_ weight: Int, _ remainingTime: Int) {
        self.weight = weight
        self.remainingTime = remainingTime
    }
    
    func driving() {
        drivingTime += 1
    }
}

func makeTrucks(weights: [Int], distance: Int) -> [Truck] {
    return weights.map { Truck($0, distance) }
}

func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    var result = 0
    var onBridge: [Truck] = []
    var currentBridgeWeight = 0
    var waitingTruck = makeTrucks(weights: truck_weights,
                                  distance: bridge_length)
    while (!waitingTruck.isEmpty || !onBridge.isEmpty) {
        result += 1
        for truck in onBridge {
            truck.isPassed ? onBridge.removeFirst() : nil
            truck.isPassed ? currentBridgeWeight -= truck.weight : nil
            truck.driving()
        }
        guard let truck = waitingTruck.first else { continue }
        if currentBridgeWeight + truck.weight <= weight {
            currentBridgeWeight += truck.weight
            onBridge.append(truck)
            waitingTruck.removeFirst()
        }
    }
    
    return result
}

print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10]))

