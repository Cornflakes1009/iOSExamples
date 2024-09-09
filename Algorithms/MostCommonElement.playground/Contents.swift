import UIKit

let nameArray = ["Bob", "Sally", "Bob", "Sam", "Michael"]
func mostCommonNameInArray(array: [String]) -> String {
    var nameCountDictionary = [String: Int]()
    for name in array {
        if let count = nameCountDictionary[name] {
            nameCountDictionary[name] = count + 1
        } else {
            nameCountDictionary[name] = 1
        }
    }
    
    var mostCommonName = ""
    for key in nameCountDictionary.keys {
        if mostCommonName == "" {
            mostCommonName = key
        } else {
            let count = nameCountDictionary[key]
            if count! > nameCountDictionary[mostCommonName]! {
                mostCommonName = key
            }
        }
        print("\(key): \(nameCountDictionary[key]!)")
    }
    return mostCommonName
}

print(mostCommonNameInArray(array: nameArray))
