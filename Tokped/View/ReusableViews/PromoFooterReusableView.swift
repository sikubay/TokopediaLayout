//
//  PromoFooterReusableView.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/2/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class PromoFooterReusableView: UICollectionReusableView {
    
    //MARK: - Properties
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = UIColor.systemGreen
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        
        return pageControl
    }()
    
    private let showPromoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Lihat semua promo", for: .normal)
        button.setTitleColor(UIColor.systemGreen, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 11.0)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(showPromoButtonPressed), for: .touchUpInside)
        
        return button
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
        
        let stackView = UIStackView(arrangedSubviews: [pageControl, showPromoButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 20.0, paddingRight: 20.0)
        stackView.centerY(in: self)
    }
    
    //MARK: - Selectors
    
    @objc func showPromoButtonPressed() {
        debugPrint("DEBUG: Show promo button pressed...")
    }
}
