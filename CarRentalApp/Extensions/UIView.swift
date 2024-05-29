//
//  File.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 29.05.24.
//

import UIKit
import Kingfisher


func showImage(image: String, imageView: UIImageView) {
    if let url = URL(string: image) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}

