//
//  baskethandler.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import Foundation

struct BasketHandler {
    let SumClosure: ([CarModel]) -> String = { cars in
        var result = 0
        
        cars.forEach {
            result += Int($0.price)!
        }
        
        return String(describing: result)
    }
}
