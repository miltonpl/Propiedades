//
//  APIModel.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import UIKit

protocol PhotoProtocol {
    var strURL: String? { get }
    var site: String? { get }
    init(dictionary: NSDictionary)
}
struct Splash: Decodable {
    var images: [Image]?
    
}

struct Image: Decodable {
    var url: String?
    var site: String?
}

//struct Photo: PhotoProtocol {
//    var strURL: String?
//    var site: String?
//
//    init(dictionary: NSDictionary) {
//        self.strURL = dictionary["url"] as? String
//        self.site = dictionary["site"] as? String
//    }
//}
