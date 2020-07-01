//
//  PropertyListData.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 21/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation
import UIKit

struct PropertyListData: Codable {
   public var properties: [PropertyItems]
}

struct PropertyItems:Codable {
    public var id: Int
    public var name: String
    public var type: String
    public var overallRating: Ratings
    public var images: [ImageItems]
    public var lowestPricePerNight: Price
}

struct Ratings:Codable {
    public var overall: Int?
}

struct Price: Codable {
    public var value: String
    public var currency: String
}

struct ImageItems:Codable{
    public var suffix: String
    public var prefix: String
}

