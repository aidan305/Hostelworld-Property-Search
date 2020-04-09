//
//  PropertyDetailsData.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 23/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation
import UIKit

struct PropertyDetailsData: Codable {
    public var name: String
    public var description: String
    public var directions: String
    public var address1: String
    public var city: CityElements
    public var images: [ImageElements]
}

struct CityElements: Codable {
    public var name: String
    public var country: String
}

struct ImageElements: Codable {
    public var suffix: String
    public var prefix: String
}

