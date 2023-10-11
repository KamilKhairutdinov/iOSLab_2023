//
//  BasketViewController.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import UIKit

class BasketViewController: UIViewController {

    // MARK: - Variables
    
    private let basketView: BasketView = BasketView(frame: .zero)
    
    // MARK: - Life cycle
    override func loadView() {
        view = basketView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Корзина"
    }
}
