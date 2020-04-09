//
//  PropertyDetailsItem.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 23/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation

class PropertyDetailsItem{
    var propertyName: String
    var address1: String
    var address2: String
    var city: String
    var country: String
    var propertyDescription: String
    var propertyDirections: String
    var imageUrl: URL

    init(propertyName: String, address1: String, address2: String, city: String, country: String, propertyDescription: String, propertyDirections: String, imageUrl: URL) {

        self.propertyName = propertyName
        self.address1 = address1
        self.address2 = address2
        self.city = city
        self.country = country
        self.propertyDescription = propertyDescription
        self.propertyDirections = propertyDirections
        self.imageUrl = imageUrl
    }
    
}
