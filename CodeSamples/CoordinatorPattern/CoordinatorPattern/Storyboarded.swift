//
//  Storyboarded.swift
//  CoordinatorPattern
//
//  Created by Harold Davidson on 7/20/25.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self // whatever conforms to this protocol will have an instantiated method on the type of itself that when called will return the type.
}

// allows us to create view controllers in a storyboard with the same name as their class ID
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
