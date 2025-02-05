//
//  APICaller.swift
//  CombineIntro
//
//  Created by Harold Davidson on 2/4/25.
//

import Foundation
import Combine

class APICaller {
    static let shared = APICaller()
    
    func fetchCompanies() -> Future<[String], Error> {
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                promise(.success(["Apple", "Google", "Microsoft", "Facebook"]))
            }
        }
    }
}
