//
//  NetworkLayer.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import Foundation
enum NetworkLayerError: Error {
    case endPoint(String)
    case server(Error)
    case unknown
    case response(String)
    case jsonDecoder(Error)

}

class NetworkLayer {
    // MARK: Properties
    let session: URLSession
    
    // MARK: Initialization
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: Public Function
    public func request(endPoint: EndPoint, completion: @escaping (Result<Data, NetworkLayerError>) -> Void) {
        guard let url = endPoint.url else {
            return completion(.failure(.endPoint("Anable to unwrapped URL from EndPoint")))
        }
        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                
                completion(.failure(.server(error)))
                
            } else if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 {
                    if let data = data {
                        completion(.success(data))
                    } else {
                        completion(.failure(.response("No data when unwrapping")))
                    }
                } else {
                    completion(.failure(.response("Response in not in range onf 200...299")))
                }
            } else {
                
                completion(.failure(.unknown))
            }
        }.resume()
    }
}
