//
//  APIRequest.swift
//  PinterestApp
//
//  Created by 김가영 on 2023/02/18.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case badRequest
    case decodingFailed(Error)
    case unknown(Error)
}

protocol APIRequest {
    associatedtype Response: Decodable
    var url: String { get }
    var headers: [String: String] { get }
    var queries: [String: String] { get }
    
    func request() -> AnyPublisher<Response, NetworkError>
}

extension APIRequest {
    func request() -> AnyPublisher<Response, NetworkError> {
        guard var url = URL(string: url) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        queries.forEach { (key, value) in
            url.append(queryItems: [URLQueryItem(name: key, value: value)])
        }
        
        var request = URLRequest(url: url)
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) in
                if let response = response as? HTTPURLResponse,
                   response.statusCode == 400 {
                    throw NetworkError.badRequest
                }
                return data
            }
            .mapError { NetworkError.unknown($0) }
            .decode(type: Response.self, decoder: JSONDecoder())
            .mapError { NetworkError.decodingFailed($0) }
            .eraseToAnyPublisher()
    }
}
