//
//  MainTabBarController.swift
//  Analoger
//
//  Created by Егор Бадмаев on 19.02.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTabs()
    }
    
    func createTabs() {
        let mainViewController = createNavController(viewController: AnalogerViewController(), itemName: "Analoger", itemImage: "curlybraces.square.fill")
        let historyViewController = createNavController(viewController: HistoryViewController(), itemName: "History", itemImage: "clock.fill")
        
        viewControllers = [mainViewController, historyViewController]
    }
    
    func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = UITabBarItem(title: itemName, image: UIImage(named: itemImage), tag: 0)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
