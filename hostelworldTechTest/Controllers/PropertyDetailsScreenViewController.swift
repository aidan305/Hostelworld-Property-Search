//
//  PropertyDetailsScreenViewController.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 23/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import UIKit

class PropertyDetailsScreenViewController: UIViewController {

    var propertyDetailsItemArray: [PropertyDetailsItem] = []
    let propertyDetailsPepository = PropertyDetailsRepository()
    var propertyID: String?




    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertAddress: UILabel!
    @IBOutlet weak var propertyCity: UILabel!
    @IBOutlet weak var propertyCountry: UILabel!
    @IBOutlet weak var propertyDescription: UILabel!
    @IBOutlet weak var propertyDirection: UILabel!
    @IBOutlet weak var propertyDetailsImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let propertyID = propertyID else {
            print("error")
            return
        }


        propertyDetailsPepository.fetchProperyDetails(propertyID: propertyID, completion:  { (PropertyDetailsDataModel) in

            if let propertyDetails = PropertyDetailsDataModel {
                let imageURLString = "\(propertyDetails.images[0].prefix)\(propertyDetails.images[0].prefix)"
                let imageURL = URL(string: imageURLString)

                let propertyDetailsItem = PropertyDetailsItem(propertyName: propertyDetails.name, address1: propertyDetails.address1, address2: propertyDetails.address1, city: propertyDetails.city.name, country: propertyDetails.city.country, propertyDescription: propertyDetails.description, propertyDirections: propertyDetails.directions, imageUrl: imageURL!)


                self.setPropertyDetails(propertyDetailsItem: propertyDetailsItem)
            }
        })
    }
    

    func setPropertyDetails(propertyDetailsItem: PropertyDetailsItem){

        print("the value for name is \(propertyDetailsItem.propertyName)")

        DispatchQueue.main.async {

            self.propertyDirection.lineBreakMode = .byWordWrapping
            self.propertyDirection.numberOfLines = 0

            self.propertyName.text = "\(propertyDetailsItem.propertyName)"
            self.propertyCountry.text = propertyDetailsItem.country
            self.propertyCity.text = propertyDetailsItem.city
            self.propertAddress.text = propertyDetailsItem.address1
            self.propertyDirection.text = propertyDetailsItem.propertyDirections
            self.propertyDescription.text = propertyDetailsItem.propertyDescription

        }

        propertyDetailsItem.imageUrl = URL(string: "https://a.hwstatic.com/image/upload/f_auto,q_auto/v1/propertyimages/4/48058/2.jpg")!

            DispatchQueue.global(qos: .background).async {
                guard let data = try? Data(contentsOf: propertyDetailsItem.imageUrl) else { return }

                if let image = UIImage(data: data) {
                    DispatchQueue.main.async { [weak self] in // back to main thread for UI changes
                        self?.propertyDetailsImage.contentMode = .scaleAspectFit
                        self?.propertyDetailsImage.image = image
                    }
                }
            }
    }
}




