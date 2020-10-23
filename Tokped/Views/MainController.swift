//
//  MainController.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 8/31/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit


class MainController: UITabBarController {
    
    //MARK: - Properties

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureRootViewControllers()
    }
    
    //MARK: - Helpers
    
    private func configureViewController() {
        
        view.backgroundColor = UIColor.white
        tabBar.tintColor = UIColor.systemGreen
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = false
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.25
        
    }
    
    private func configureRootViewControllers() {
        
        let homeController = StorefontController()
        let navigation = UINavigationController(rootViewController: homeController)
        navigation.tabBarItem.image = UIImage(systemName: "cart")!
        navigation.tabBarItem.tag = 0
        navigation.title = "Produk"
       
        viewControllers = [navigation]
    }
    
}
