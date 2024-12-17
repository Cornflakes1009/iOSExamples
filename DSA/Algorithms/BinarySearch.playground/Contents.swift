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

var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20]

func binarySearch(array: [Int], key: Int) -> Bool {
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midIndex = maxIndex / 2
    let midValue = array[minIndex]
    
    if key < array[minIndex] || key > array[maxIndex] { return false }
    
    if key > midValue {
        let slice = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    if key < midValue {
        let slice = Array(array[minIndex + 1...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    
    if key == midValue {
        return true
    }
    
    return false
}

binarySearch(array: arr, key: 16)
