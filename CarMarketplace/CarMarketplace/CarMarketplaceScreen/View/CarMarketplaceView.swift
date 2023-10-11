//
//  CarMarketplaceUIView.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import UIKit

class CarMarketplaceView: UIView {
    
    // MARK: - UI elements
    lazy var carTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: CarsTableViewCell.reuseIdentifier)
        
        return tableView
    }()
    
    // MARK: - Variables
    weak var carMarkeViewController: CarMarketViewController?
    
    var carData: CarData = CarData()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(carTableView)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CarMarketplaceView {
    private func addSubviews(subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    private func configureUI() {
        NSLayoutConstraint.activate([
            carTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            carTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            carTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            carTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension CarMarketplaceView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //carMarkeViewController
    }
}
