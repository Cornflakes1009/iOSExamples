import UIKit

// split arrays
func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let leftArray = Array(array[0..<array.count/2])
    let rightArray = Array(array[array.count/2..<array.count])
    
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

// merge arrays
func merge(left: [Int], right: [Int]) -> [Int] {
    var mergedArray: [Int] = []
    var left = left
    var right = right
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
    return mergedArray + left + right
}

var arr = [7, 6, 5, 4, 3, 2, 1, 0, 9, 8, -1, 2]
print(mergeSort(array: arr))
