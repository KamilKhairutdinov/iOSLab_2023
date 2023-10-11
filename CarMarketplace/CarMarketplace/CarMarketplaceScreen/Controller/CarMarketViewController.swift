//
//  CarMarketViewController.swift
//  CarMarketplace
//
//  Created by Камил Хайрутдинов on 10.10.2023.
//

import UIKit

protocol CarHandler: AnyObject {
    func addCarToBasket()
}

enum TableViewSections {
    case main
}

class CarMarketViewController: UIViewController, UITableViewDelegate {

    // MARK: - Variables
    private lazy var carMarketPlaceView = CarMarketplaceView(frame: .zero)
    
    var dataSource: UITableViewDiffableDataSource<TableViewSections, CarModel>?
    
    var carData: CarData = CarData()
    
    // MARK: - Life cycle
    override func loadView() {
        view = carMarketPlaceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupDataSource(tableView: carMarketPlaceView.carTableView, cars: carData.allCars)
    }
}

extension CarMarketViewController {
    
    // MARK: - func setupNavigationBar
    private func setupNavigationBar() {
        navigationItem.title = "Car market"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket.fill"), primaryAction: UIAction(handler: { [weak self] _ in
            self?.navigationController?.pushViewController(BasketViewController(), animated: true)
        }))
    }
    
    // MARK: - func setupDataSource
    func setupDataSource(tableView: UITableView, cars: [CarModel]) {
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, car in
            let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.reuseIdentifier, for: indexPath) as! CarsTableViewCell
            cell.configureCell(car: car)
            return cell
        })
      
        self.updateData(with: cars, animate: false)
    }
    
    // MARK: - updateData
    func updateData(with cars: [CarModel], animate: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<TableViewSections, CarModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cars)
        dataSource?.apply(snapshot, animatingDifferences: animate)
        print(snapshot.numberOfItems)
    }
}
