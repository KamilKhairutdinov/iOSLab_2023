//
//  CarDataSource.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import Foundation
import UIKit

struct CarData {
    var allCars: [CarModel] = [
        CarModel(id: UUID(), mark: "nissan", model: "silvia s15", price: "123213", imageName: "silvia"),
        CarModel(id: UUID(), mark: "nissan", model: "silvia s15", price: "123213", imageName: "silvia"),
        CarModel(id: UUID(), mark: "nissan", model: "silvia s15", price: "123213", imageName: "silvia"),
        CarModel(id: UUID(), mark: "nissan", model: "silvia s15", price: "123213", imageName: "silvia"),
        CarModel(id: UUID(), mark: "nissan", model: "silvia s15", price: "123213", imageName: "silvia")
        ]
    var carsInBasket: [CarModel] = []
}
