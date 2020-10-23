//
//  SearchController.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/3/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
    
    //MARK: - Properties
    
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        configureController()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        configureSelfSearchController(placeholder: "Cari produk")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //
        DispatchQueue.main.async {
            self.searchController.searchBar.becomeFirstResponder()
        }
        
    }
    
    //MARK: - Helpers
    
    private func configureController() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
    }
    
    private func configureSelfSearchController(placeholder: String) {
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsCancelButton = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.placeholder = placeholder
        
        navigationItem.titleView = searchController.searchBar
        definesPresentationContext = true
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    //MARK: - Selectors
    
    @objc func cancelButtonPressed() {
        
        searchController.dismiss(animated: true) {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
