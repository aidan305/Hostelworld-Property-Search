//
//  PropertyDetailsItemView.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 23/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import UIKit

class PropertyDetailsItemView: UIView {

    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertAddress: UILabel!
    @IBOutlet weak var propertyCity: UILabel!
    @IBOutlet weak var propertyCountry: UILabel!
    @IBOutlet weak var propertyDescription: UILabel!
    @IBOutlet weak var propertyDirection: UILabel!
    @IBOutlet weak var propertyDetailsImage: UIImageView!


    func setPropertyDetails(propertyDetailsItem: PropertyDetailsItem){
        print("the value for name is \(propertyDetailsItem.propertyName)")
            propertyName.text = "\(propertyDetailsItem.propertyName)"
            propertyCountry.text = propertyDetailsItem.country
            propertyCity.text = propertyDetailsItem.city
            propertAddress.text = propertyDetailsItem.address1
            propertyDirection.text = propertyDetailsItem.propertyDirections
            propertyDescription.text = propertyDetailsItem.propertyDescription
            DispatchQueue.global(qos: .background).async {
                guard let data = try? Data(contentsOf: propertyDetailsItem.imageUrl) else { return }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in // back to main thread for UI changes
                        self?.propertyDetailsImage.image = image
                    }
                }
            }

        }
    }


