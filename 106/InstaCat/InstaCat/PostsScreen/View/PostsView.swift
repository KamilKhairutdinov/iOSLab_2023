//
//  PictureDetailView.swift
//  InstaCat
//
//  Created by Камил Хайрутдинов on 28.10.2023.
//

import UIKit

class PostsView: UIView {
    // MARK: - UI elements
    private lazy var searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.barTintColor = .black
        searchbar.placeholder = "Поиск"
        searchbar.backgroundColor = .white
        searchbar.translatesAutoresizingMaskIntoConstraints = false
        return searchbar
    }()

    lazy var postTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self,
        forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        tableView.backgroundColor = .black
        return tableView
    }()

    // MARK: - Variables
    weak var controller: PostsViewController?
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubviews(subviews: searchBar, postTableView)
        configureUI()
        setupSwipeGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PostsView {
    private func addSubviews(subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }

    func setupDataSource(_ dataSource: UITableViewDataSource) {
        postTableView.dataSource = dataSource
    }

    func reloadData() {
        postTableView.reloadData()
    }

    func scrollToIndexPath(_ indexPath: IndexPath) {
        postTableView.scrollToRow(at: indexPath, at: .middle, animated: true)
    }

    private func configureUI() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            postTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            postTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            postTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PostsView: PostTableAlertDelegate {

    func presentAlert(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Удалить пост", message: "Вы действительно хотите удалить этот пост?", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Удалить", style: .destructive, handler: {  [weak self] _ in
            self?.controller?.delete(indexPath: indexPath)
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        controller?.present(alert)
    }

    func setupSwipeGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))

        swipeGesture.direction = .right
        self.addGestureRecognizer(swipeGesture)
    }

    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            controller?.dismissScreen()
        }
    }

}
