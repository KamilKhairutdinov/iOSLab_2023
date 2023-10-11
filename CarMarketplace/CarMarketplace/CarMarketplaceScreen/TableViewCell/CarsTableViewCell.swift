//
//  CarsTableViewCell.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import UIKit

class CarsTableViewCell: UITableViewCell {
    // MARK: - UI elements
    private lazy var carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
        
    }()
    
    private lazy var carMarkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var carModelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var carPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.textAlignment = .left
        
        return label
    }()
    
    private var addCarToBasketButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        button.setImage(UIImage(systemName: "plus.app.fill"), for: .highlighted)
        
        return button
    }()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews(subviews: carImageView, carMarkLabel, carModelLabel, carPriceLabel, addCarToBasketButton)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarsTableViewCell {
    private func addSubviews(subviews: UIView...) {
        subviews.forEach { contentView.addSubview($0) }
    }
    
    private func configureUI() {
        NSLayoutConstraint.activate([
            carImageView.widthAnchor.constraint(equalToConstant: 100),
            carImageView.heightAnchor.constraint(equalToConstant: 100),
            carImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            carImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            carImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            carMarkLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
            carMarkLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            carMarkLabel.trailingAnchor.constraint(equalTo: addCarToBasketButton.leadingAnchor, constant: 10),

            carModelLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
            carModelLabel.topAnchor.constraint(equalTo: carMarkLabel.bottomAnchor, constant: 20),
            carModelLabel.trailingAnchor.constraint(equalTo: addCarToBasketButton.leadingAnchor, constant: 10),
            
            carPriceLabel.leadingAnchor.constraint(equalTo: carImageView.trailingAnchor, constant: 10),
            carPriceLabel.topAnchor.constraint(equalTo: carModelLabel.bottomAnchor, constant: 20),
            carPriceLabel.trailingAnchor.constraint(equalTo: addCarToBasketButton.leadingAnchor, constant: 10),
            
            addCarToBasketButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addCarToBasketButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addCarToBasketButton.widthAnchor.constraint(equalToConstant: 25),
            addCarToBasketButton.heightAnchor.constraint(equalToConstant: 25),
        ])
    }

    func configureCell(car: CarModel) {
        carImageView.image = UIImage(named: car.imageName)
        carMarkLabel.text = car.mark
        carModelLabel.text = car.model
        carPriceLabel.text = car.price + " руб."
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
