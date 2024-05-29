//
//  CarModels.swift
//  CarRentalApp
//
//  Created by Seymur Naim on 26.05.24.
//

import Foundation

struct Categories: Codable {
    let name: String
    var cars: [Cars]
    
}

struct Cars: Codable {
    let brand: String
    let model: String
    let price: String
    let engine: String
    let image: String
}

