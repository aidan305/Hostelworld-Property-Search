//
//  PropertyDetailsRepository.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 23/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation

class PropertyDetailsRepository {

    func fetchProperyDetails(propertyID: String, completion: @escaping (PropertyDetailsData?) -> Void) {

    let propertyDetailsURL = "https://api.m.hostelworld.com/2.2/properties/\(propertyID)"

    if let url = URL(string: propertyDetailsURL){

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if error != nil {
                completion(nil)
            }

            if let data = data {
                do{
                    let PropertyDetailsDataModel = try JSONDecoder().decode(PropertyDetailsData.self, from: data)
                    completion(PropertyDetailsDataModel)
                }
                catch (let error) {
                    print("error decoding \(error)")
                    completion(nil)
                }
            } else {
                completion(nil)
            }

        }.resume()
    }
}
}
