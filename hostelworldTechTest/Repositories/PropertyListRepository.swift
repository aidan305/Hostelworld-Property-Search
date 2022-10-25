//
//  PropertyListRepository.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 21/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation

class PropertyListRepository {

func fetchProperties(completion: @escaping (PropertyListData?) -> Void) {

    let propertyListURL = "https://api.m.hostelworld.com/2.2/cities/1530/properties/"

    if let url = URL(string: propertyListURL){

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, response, error) in

            if error != nil {
                completion(nil)
            }

            if let data = data {
                do{
                    let PropertyListDataModel = try JSONDecoder().decode(PropertyListData.self, from: data)
                    completion(PropertyListDataModel)
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
