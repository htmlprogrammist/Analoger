//
//  MainViewController.swift
//  Analoger
//
//  Created by Егор Бадмаев on 21.01.2022.
//

import UIKit

final class AnalogerViewController: UIViewController {
    
    lazy var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Analoger"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Search"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(openSettings))
        
        setupView()
        setConstraints()
    }
    
    @objc func openSettings() {
        let destination = UINavigationController(rootViewController: SettingsViewController())
        navigationController?.present(destination, animated: true, completion: nil)
    }
}

extension AnalogerViewController {
    
    private func setupView() {
        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
}
