//
//  PropertyListTableViewCell.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 20/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import UIKit

class PropertyListTableViewCell: UITableViewCell {

    @IBOutlet weak var propertyImageView: UIImageView!

    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!

    func setPropertyListItem(propertylistItem: PropertyListItem){
        ratingLbl.text = "\(propertylistItem.rating)"
        nameLbl.text = propertylistItem.propertyName
        typeLbl.text = propertylistItem.propertyType
        
        if let secureURL = URL(string: "https://" + "\(propertylistItem.url)") {
            DispatchQueue.global(qos: .background).async {
                guard let data = try? Data(contentsOf: secureURL) else { return }
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in // back to main thread for UI changes
                        self?.propertyImageView.image = image
                    }
                }
            }
        }
    }
    
}


