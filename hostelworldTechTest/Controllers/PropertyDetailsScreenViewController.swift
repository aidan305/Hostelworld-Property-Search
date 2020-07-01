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
                let imageURLString = "https://\(propertyDetails.images[0].prefix)\(propertyDetails.images[0].suffix)"
                let imageURL = URL(string: imageURLString)

                let propertyDetailsItem = PropertyDetailsItem(propertyName: propertyDetails.name, address1: propertyDetails.address1, address2: propertyDetails.address1, city: propertyDetails.city.name, country: propertyDetails.city.country, propertyDescription: propertyDetails.description, propertyDirections: propertyDetails.directions, imageUrl: imageURL!)


                self.setPropertyDetails(propertyDetailsItem: propertyDetailsItem)
            }
        })
    }
    

    func setPropertyDetails(propertyDetailsItem: PropertyDetailsItem){

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
        
        DispatchQueue.global().async {
            print(propertyDetailsItem.imageUrl)
            let data = try? Data(contentsOf: propertyDetailsItem.imageUrl) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.propertyDetailsImage.image = UIImage(data: data!)
            }
        }
    }
}




