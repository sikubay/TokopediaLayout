//
//  SecondProductCell.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/4/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class SecondProductCell: UICollectionViewCell {
    
    //MARK: - Properties
    var colors: UIColor? {
        didSet {
            backgroundColor = colors
        }
    }
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


