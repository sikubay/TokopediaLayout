//
//  ProductHorizontal.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/4/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class ProductHorizontal: UICollectionViewCell {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureCollectionViewCell() {
        backgroundColor = UIColor.systemGreen
    }
}
