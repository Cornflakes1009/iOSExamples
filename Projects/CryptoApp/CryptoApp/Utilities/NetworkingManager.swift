//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Harold Davidson on 1/12/25.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)."
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    static func download(url: URL) -> AnyPublisher<Data, any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default)) // this is done on a BACKGROUND thread - not the Main thread
            .tryMap({ try handleURLResponse(output: $0, url: url )})
            .receive(on: DispatchQueue.main) // return to the main thread
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
//        throw NetworkingError.badURLResponse(url: url) // can uncomment this to force an error
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
