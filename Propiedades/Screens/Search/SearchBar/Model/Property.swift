//
//  Property.swift
//  Propiedades
//
//  Created by Milton Palaguachi on 1/7/21.
//

import Foundation
import RealmSwift

enum PropertyType: String {
    case single = "Single Family"
    case multi = "Multi Family"
    case apartment = "Apartament"
    case condo = "Condo"
    case studio = "Studio"
    case room = "Room"
}

struct Property {
    var familyType: PropertyType
    var bedsCount: String?
    var baths: String?
    var squareFeet: String?
    var address: Address
}

struct Address {
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipeCode: String?
}

class Pet: Object {
    @objc dynamic var name: String?
    @objc dynamic var color: String?
    @objc dynamic var gender: String?
}
