//
//  PropertyList.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 20/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation
import UIKit

 class PropertyListItem {
    var url: URL
    var propertyName: String
    var propertyType: String
    var rating: Int
    var id: String

    init(url: URL, propertyName: String, propertyType: String, rating: Int, id: String) {
        self.url = url
        self.propertyName = propertyName
        self.propertyType = propertyType
        self.rating = rating
        self.id = id
    }

}


