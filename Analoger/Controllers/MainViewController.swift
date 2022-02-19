//
//  MainViewController.swift
//  Analoger
//
//  Created by Егор Бадмаев on 21.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let searchController = UISearchController()
    
    let historyTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    let toolBar: UIToolbar = {
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        return toolBar
    }()
    // questionmark.app.fill
    // questionmark.square.fill
    // questionmark.circle.fill
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Analoger"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search"
        
        setupView()
        setConstraints()
    }
    
    @objc func openSettings() {
        let destination = UINavigationController(rootViewController: SettingsViewController())
        navigationController?.present(destination, animated: true, completion: nil)
    }
    
    @objc func handleFoundMistake() {
        print("Found mistake?")
    }
}

extension MainViewController {
    func setupView() {
        view.addSubview(historyTableView)
        view.addSubview(toolBar)
        
        let foundMistake = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(handleFoundMistake))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let settings = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(openSettings))
        toolBar.setItems([foundMistake, space, settings], animated: true)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            historyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            historyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: toolBar.topAnchor),
            
            toolBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
