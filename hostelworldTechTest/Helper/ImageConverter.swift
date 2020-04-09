//
//  ImageConverter.swift
//  hostelworldTechTest
//
//  Created by Aidan Egan on 22/03/2020.
//  Copyright © 2020 Aidan Egan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ImageConvertor {

    func convertImageURLToUIImage(imageURL: String) -> UIImageView {


        let uiImageToReturn = UIImageView()

        if let url = URL(string: imageURL) {
            uiImageToReturn.sd_setImage(with: url)
        }


        return uiImageToReturn

//       first attempt:
//        let url = URL(string:imageURL)
//        if let data = try? Data(contentsOf: url!)
//        {
//            if let image: UIImage = UIImage(data: data) {
//                imageToReturn = #imageLiteral(resourceName: "beginner-first-app")
//            }
//
//        }

//        DispatchQueue.global(qos: .background).async {
//               do
//                {
//                     let data = try Data.init(contentsOf: URL.init(string: imageURL)!)
//                      DispatchQueue.main.async {
//                        if let image: UIImage = UIImage(data: data) {
//                            imageToReturn = image
//                        }
//                      }
//                }
//               catch {
//                      // error
//                     }
//        }


//        second attempt:
//        var imageToReturn = UIImage()
//        let url:URL = URL(string: imageURL)!
//        let session = URLSession.shared
//
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if data != nil
//            {
//                let image = UIImage(data: data!)
//                if(image != nil)
//                {
//                    imageToReturn = image!
//                }
//            }
//        }


    }
}
