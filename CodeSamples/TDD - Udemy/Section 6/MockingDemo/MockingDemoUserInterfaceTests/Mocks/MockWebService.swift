//
//  MockWebService.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Harold Davidson on 11/24/25.
//

import Foundation
//@testable import MockingDemo // can import the file needed for the protocol using this import

class MockWebService: NetworkService {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure((.notAuthenticated)))
        }
        
    }
}
