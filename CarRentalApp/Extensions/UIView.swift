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
        imageView.kf.setImage(with: url)
    } else {
        print("Invalid URL string")
    }
}

