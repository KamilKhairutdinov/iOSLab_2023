//
//  CarModel.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import Foundation

struct CarModel: Hashable, Identifiable {
    let id: UUID
    let mark: String
    let model: String
    let price: String
    let imageName: String
}
