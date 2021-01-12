//
//  EndPoint.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import Foundation

struct EndPoint {
    let path: String
    let queryItems: [URLQueryItem]
    var header: [String: String]?
}

extension EndPoint {
    
    static func search(matching query: String) -> EndPoint {
        return EndPoint(path: "/api/v1/images/search", queryItems:
                            [URLQueryItem(name: "query", value: query)])
    }
    
    var url: URL? {
        var component = URLComponents()
        component.scheme = "http"
        component.host = "www.splashbase.co"
        component.path = self.path
        component.queryItems = self.queryItems
        return component.url
    }
}
