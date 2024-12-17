import UIKit

var unsortedArray = [9, 0, 14, 409, 16, 2, -1, 25, 11, 5, 12, -9, 13]

// MARK: - While Loop
//func bubbleSort(arr: [Int]) -> [Int] {
//    var array = arr
//    var sorted = false
//
//    while !sorted {
//        var counter = 0
//
//        for i in 0..<array.count - 1 {
//            if i != array.count && array[i] > array[i + 1] {
//                counter += 1
//                let temp = array[i]
//                array[i] = array[i + 1]
//                array[i + 1] = temp
//            }
//        }
//
//        if counter == 0 {
//            sorted = true
//        }
//    }
//    return array
//}
//
//print(bubbleSort(arr: unsortedArray))





// MARK: - Recursion
var sorted = false
//var arr1 = [Int]()

func bubbleSort(arr: [Int]) -> [Int] {
    var arr1 = arr
    var counter = 0

    if !sorted {
        for i in 0..<arr1.count - 1 {
            if arr1[i] > arr1[i + 1] {
                counter += 1
                let temp = arr1[i]
                arr1[i] = arr1[i + 1]
                arr1[i + 1] = temp
            }
        }
    }

    if counter > 0 {
        print("\(arr1)")
        bubbleSort(arr: arr1)
    } else {
        sorted = true
    }

    return arr1
}

print("Sorted Array: \(bubbleSort(arr: unsortedArray))")


// MARK: - Two Loops
//for j in 0...unsortedArray.count {
//    print(j)
//}

//func bubbleSort(arr: [Int]) -> [Int] {
//    var array = arr
//    for _ in 0..<array.count - 1 {
//        for i in 0..<array.count - 1 {
//            print(i)
//            if array[i] > array[i + 1] {
//                let temp = array[i]
//                array[i] = array[i + 1]
//                array[i + 1] = temp
//            }
//        }
//    }
//    return array
//}
//
//print(bubbleSort(arr: unsortedArray))
