//
//  SliderCell.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 8/31/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class PromoCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    var colors: UIColor? {
        didSet {
            configure()
        }
    }
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        configureCollectioViewCell()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    
    private func configureCollectioViewCell() {
        
    }
    
    func configure() {
        backgroundColor = colors
    }
}
