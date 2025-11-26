//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Harold Davidson on 11/25/25.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        guard ProcessInfo.processInfo.environment["ENV"] == "TEST" else {
            return Webservice()
        }
        return MockWebService()
    }

}
