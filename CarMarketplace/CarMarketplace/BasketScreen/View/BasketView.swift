//
//  BasketView.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import UIKit

class BasketView: UIView {
    private lazy var basketTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    private lazy var priceSumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Общая сумма: "
        
        return label
    }() 
    
    private lazy var carCountLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "Кол-во машин: "
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BasketView {
    private func addSubviews(subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    private func configureUI() {
        let stackView = UIStackView(arrangedSubviews: [priceSumLabel, carCountLabel])
        stackView.axis = .horizontal
        
        addSubviews(subviews: stackView, basketTableView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            basketTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            basketTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            basketTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            basketTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
