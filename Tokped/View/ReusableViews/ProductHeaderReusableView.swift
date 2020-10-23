//
//  ProductHeaderReusableView.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/3/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class ProductHeaderReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        configureReusableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureReusableView() {
        backgroundColor = .systemGray3
    }
}


class SecondProductHeaderReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        configureReusableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureReusableView() {
        backgroundColor = .systemGray3
    }
}

