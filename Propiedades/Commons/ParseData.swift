//
//  ParseData.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import Foundation
class ParseData {
    let network: NetworkLayer
    
    init(network: NetworkLayer) {
        self.network = network
    }
    
    public func parseData<T: Decodable>(type: T.Type, query: String, completion: @escaping(Result<T, NetworkLayerError>) -> Void) {
        var tempResult: Result<T, NetworkLayerError>?
        self.network.request(endPoint: .search(matching: query)) { result in
            DispatchQueue.global().async {
                switch result {
                case .success(let data):
                    do {
                        let objData = try JSONDecoder().decode(T.self, from: data)
                        tempResult = .success(objData)
                        
                    } catch {
                        tempResult = .failure(.jsonDecoder(error))
                    }
                case .failure(let error):
                    tempResult = .failure(error)
                }
                
                DispatchQueue.main.async {
                    if let result = tempResult {
                        completion(result)
                    }
                }
            }
        }
    }
}
