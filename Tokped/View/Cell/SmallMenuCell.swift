//
//  SmallMenuCell.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/2/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class SmallMenuCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGreen
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "bag.circle.fill")
        
        return imageView
    }()
    
    private let iconLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.text = "Lihat semua kategori"
        
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //
        configureCollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureCollectionViewCell() {
        backgroundColor = UIColor.clear
        
        addSubview(iconImage)
        iconImage.anchor(top: self.topAnchor, paddingTop: 5.0, width: 50.0, height: 50.0)
        iconImage.layer.cornerRadius = 50.0 / 2
        iconImage.centerX(in: self)
        
        addSubview(iconLabel)
        iconLabel.setProportionalWidth(for: self.widthAnchor, multiplier: 0.95)
        iconLabel.anchor(top: iconImage.bottomAnchor, paddingTop: 5.0)
        iconLabel.centerX(in: self)
    }
}
