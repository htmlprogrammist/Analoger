//
//  DocsViewController.swift
//  Analoger
//
//  Created by Егор Бадмаев on 21.01.2022.
//

import UIKit

final class DocsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(handleFoundMistake))
        
        setupView()
    }
    
    @objc func handleFoundMistake() {
        print("Found mistake?")
    }
}

extension DocsViewController {
    
    private func setupView() {
        
    }
    
    private func setConstraints() {
        
    }
}
