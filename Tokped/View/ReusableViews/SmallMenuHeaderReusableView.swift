//
//  SmallMenuReusableView.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/2/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class SmallMenuHeaderReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = .init(width: 0.2, height: 0.3)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 5.0
        view.layer.cornerRadius = 10.0
      
        
        return view
    }()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureReusableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureReusableView() {
        
        backgroundColor = UIColor.white
        
        addSubview(containerView)
        containerView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 5.0, paddingLeft: 20.0, paddingBottom: 5.0, paddingRight: 20.0)
        containerView.centerY(in: self)
        containerView.centerX(in: self)
        
    }
    
}

class SmallMenuFooterReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureReusableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureReusableView() {
        
        backgroundColor = UIColor.systemGreen
        
       
    }
}


