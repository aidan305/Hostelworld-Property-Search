//
//  PropertyListScreen.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 20/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import UIKit



class PropertyListScreenViewController: UIViewController {

    var propertyListItemArray: [PropertyListItem] = []
    let propertyListPepository = PropertyListRepository()

    @IBOutlet weak var propertyListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        propertyListTableView.delegate = self
        propertyListTableView.dataSource = self

        propertyListPepository.fetchProperties(completion: { (propertyListDataModel) in
            if let property = propertyListDataModel {

                DispatchQueue.main.async {

                    for n in 0...property.properties.count - 1 {

                        let propertyListItem = self.convertDataToPropertyListItem(propertyName: property.properties[n].name, propertyType: property.properties[n].type, propertyRating: property.properties[n].overallRating.overall, imagePrefix: property.properties[n].images[0].prefix, imageSuffix: property.properties[n].images[0].suffix, id: property.properties[n].id)

                         self.propertyListItemArray.append(propertyListItem)
                         self.propertyListTableView.reloadData()
                    }
                }
            }
        })

        propertyListTableView.reloadData()

    }

    func convertDataToPropertyListItem(propertyName: String, propertyType: String, propertyRating: Int?, imagePrefix: String, imageSuffix: String, id: String) -> PropertyListItem {
           var propertyRating = propertyRating
           let imageUrl = (imagePrefix + imageSuffix).replacingOccurrences(of: "http", with: "https")

           if propertyRating == nil {
               propertyRating = 0
           }
           let propertyListItem  = PropertyListItem(url: URL(string: imageUrl)!, propertyName: propertyName, propertyType: propertyType, rating: propertyRating ?? 0, id: id)

           return propertyListItem
       }
}

extension PropertyListScreenViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        propertyListItemArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let propertyListItem = propertyListItemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "propertyListCellItem") as! PropertyListTableViewCell

        cell.setPropertyListItem(propertylistItem: propertyListItem)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

           if let propertyDetailsScreenViewController = self.storyboard?.instantiateViewController(identifier: "PropertyDetailsScreenViewControllerID") as PropertyDetailsScreenViewController? {

            propertyDetailsScreenViewController.propertyID = propertyListItemArray[indexPath.row].id

            navigationController?.pushViewController(propertyDetailsScreenViewController, animated: true)
           }
       }
}
