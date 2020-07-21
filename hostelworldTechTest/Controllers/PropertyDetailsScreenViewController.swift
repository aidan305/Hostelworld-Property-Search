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

    
    @IBOutlet weak var propertyDetailsStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var propertyNameAddressLabel: UILabel!

    var propetyDescriptionLbl = UILabel()
    var propertyDirectionsLbl = UILabel()
    
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


                self.setPropertyDetailsUI(propertyDetailsItem: propertyDetailsItem)
            }
        })
    }
    
    
    

    func setPropertyDetailsUI(propertyDetailsItem: PropertyDetailsItem){

        DispatchQueue.main.async {
            
            
            self.propertyDirectionsLbl.text = "Directions: \(propertyDetailsItem.propertyDirections)"
            self.propetyDescriptionLbl.text = "Description: \(propertyDetailsItem.propertyDescription)"

            self.propertyDirectionsLbl.lineBreakMode = .byWordWrapping
            self.propertyDirectionsLbl.numberOfLines = 13
            
            self.propetyDescriptionLbl.lineBreakMode = .byWordWrapping
            self.propetyDescriptionLbl.numberOfLines = 10
            
            
            self.propertyDetailsStackView.addArrangedSubview(self.propetyDescriptionLbl)
            self.propertyDetailsStackView.addArrangedSubview(self.propertyDirectionsLbl)
            
            self.propertyNameAddressLabel.text = "\(propertyDetailsItem.propertyName) Hostel \n\(propertyDetailsItem.address1)\n\(propertyDetailsItem.city) \n\(propertyDetailsItem.country)"

        }
        
        DispatchQueue.global().async {
            print(propertyDetailsItem.imageUrl)
            let data = try? Data(contentsOf: propertyDetailsItem.imageUrl) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.propertyImage.image = UIImage(data: data!)
            }
        }
    }
}




