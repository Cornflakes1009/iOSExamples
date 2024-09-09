import UIKit

let numbers = [1, 3, 5, 7, 9, 10, 12, 14, 16, 18]

// n
func linearSearchForSearchValue(searchValue: Int, array: [Int]) -> Bool {
    for num in numbers {
        if num == searchValue {
            return true
        }
    }
    return false
}

print(linearSearchForSearchValue(searchValue: 5, array: numbers))

      
// log(n)
func binarySearchForSearchValue(searchValue: Int, array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        print("middleValue: \(middleValue) leftIndex: \(leftIndex), rightIndex: \(rightIndex), [\(array[leftIndex])), \(array[rightIndex])]")
        
        if middleValue == searchValue { return true }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        if searchValue > middleValue {
            leftIndex = middleIndex + 1
        }
    }
    print(false)
    return false
}

var hundredNumbers = [Int]()
for num in 1...100 {
    hundredNumbers.append(num)
}
print(binarySearchForSearchValue(searchValue: 99, array: hundredNumbers))
