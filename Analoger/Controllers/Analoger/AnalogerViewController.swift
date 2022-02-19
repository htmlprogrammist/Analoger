//
//  MainViewController.swift
//  Analoger
//
//  Created by Егор Бадмаев on 21.01.2022.
//

import UIKit

final class AnalogerViewController: UIViewController {
    
    let historyTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTableView.dataSource = self
        historyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setupNavBar()
        setupView()
        setConstraints()
    }
    
    @objc func openSettings() {
        let destination = UINavigationController(rootViewController: SettingsViewController())
        navigationController?.present(destination, animated: true, completion: nil)
    }
}

extension AnalogerViewController {
    
    private func setupNavBar() {
        title = "Analoger"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search"
        
        let navBarAppearence = UINavigationBarAppearance()
        navBarAppearence.configureWithOpaqueBackground()
        navBarAppearence.backgroundColor = UIColor(red: 23/255, green: 24/255, blue: 28/255, alpha: 1.0)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearence
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearence
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(openSettings))
    }
    
    private func setupView() {
        view.addSubview(historyTableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension AnalogerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell"
        return cell
    }
}
