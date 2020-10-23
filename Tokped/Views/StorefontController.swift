//
//  StorefontController.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 8/31/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

class StorefontController: UIViewController  {
    
    
    //MARK: - Properties
    private let statusBarView = UIView()
    private let collectionModel = CollectionViewModel.allCases
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.placeholder = "Cari produk"
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.buildCollectionParentLayout())
        
        return collectionView
    }()
    
    private let loveBarButton: UIButton = {
        let barButton = UIButton(type: .system)
        barButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        barButton.tintColor = UIColor.white
        barButton.addTarget(self, action: #selector(loveBarButtonPressed), for: .touchUpInside)
        
        return barButton
    }()
    
    private let messageBarButton: UIButton = {
        let barButton = UIButton(type: .system)
        barButton.setImage(UIImage(systemName: "envelope.fill"), for: .normal)
        barButton.tintColor = UIColor.white
        barButton.addTarget(self, action: #selector(messageBarButtonPressed), for: .touchUpInside)
        
        return barButton
    }()
    
    private let notificationBarButton: UIButton = {
        let barButton = UIButton(type: .system)
        barButton.setImage(UIImage(systemName: "bell.fill"), for: .normal)
        barButton.tintColor = UIColor.white
        barButton.addTarget(self, action: #selector(notificationBarButtonPressed), for: .touchUpInside)
        
        return barButton
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        title = "WKwkwkw"
        configureViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        configureSelfNavigationBar()
    }
    
    
    //MARK: - Helpers
    
    private func buildCollectionParentLayout() -> UICollectionViewLayout {
        
        let compositionalLayout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            switch CollectionViewModel(rawValue: section) {
                
            case .promoSection:
                let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.325))
                
                return LayoutBuilder.buildSliderSectionLayout(size: size)
                
            case .smallMenuSection:
                let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .estimated(120.0))
                let insets = NSDirectionalEdgeInsets(top: 20.0, leading: 10.0, bottom: 0.0, trailing: 0.0)
                
                return LayoutBuilder.buildSmallMenuSectionLayout(size: size, itemInsets: insets)
                
            case .productSection:
                return LayoutBuilder.buildProductSectionLayout()
                
            case .productSecondSection:
                return LayoutBuilder.buildProductSecondSectionLayout()
                
            case .productHorizontal:
                return LayoutBuilder.buildProductHorizontalSection()
                
            case .none:
                fatalError("No section available")
            }
            
        }
        
        return compositionalLayout
    }
    
    private func configureViewController() {
        view.backgroundColor = .clear
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.clear
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(PromoCell.self, forCellWithReuseIdentifier: CollectionViewModel.promoSection.reuseIdentifier)
        collectionView.register(PromoFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CollectionViewModel.promoSection.reusableFooterIdentifier)
        collectionView.register(SmallMenuCell.self, forCellWithReuseIdentifier: CollectionViewModel.smallMenuSection.reuseIdentifier)
        collectionView.register(SmallMenuHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewModel.smallMenuSection.reusableHeaderIdentifier)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: CollectionViewModel.productSection.reuseIdentifier)
        collectionView.register(ProductHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewModel.productSection.reusableHeaderIdentifier)
        collectionView.register(SecondProductCell.self, forCellWithReuseIdentifier: CollectionViewModel.productSecondSection.reuseIdentifier)
        collectionView.register(SecondProductHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewModel.productSecondSection.reusableHeaderIdentifier)
        collectionView.register(ProductHorizontal.self, forCellWithReuseIdentifier: CollectionViewModel.productHorizontal.reuseIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewModel.productHorizontal.reusableHeaderIdentifier)
        
    }
    
    private func configureSelfNavigationBar() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.backgroundColor = UIColor.clear
        appearance.shadowColor = UIColor.clear
        
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.standardAppearance = appearance
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.titleView = searchBar
        
        let stackButton = UIStackView(arrangedSubviews: [loveBarButton, messageBarButton, notificationBarButton])
        stackButton.axis = .horizontal
        stackButton.spacing = 5.0
        
        let rightBarButtons = UIBarButtonItem(customView: stackButton)
        navigationItem.rightBarButtonItem = rightBarButtons
        
    }
    
    func changeStatusBarBackgroundColor(color: UIColor? = .none) {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let statusBarWidth: CGFloat = (app?.windowScene?.statusBarManager?.statusBarFrame.width)!
            let statusBarHeight: CGFloat = (app?.windowScene?.statusBarManager?.statusBarFrame.height)!
            
            view.addSubview(statusBarView)
            statusBarView.backgroundColor = color
            statusBarView.anchor(top: view.topAnchor, width: statusBarWidth, height: statusBarHeight)
            statusBarView.centerX(in: view)
        }
    }
    
    //MARK: - Selectors
    
    @objc func loveBarButtonPressed() {
        debugPrint("DEBUG: Love button pressed")
    }
    
    @objc func messageBarButtonPressed() {
        debugPrint("DEBUG: Message button pressed")
    }
    
    @objc func notificationBarButtonPressed() {
        debugPrint("DEBUG: Notification button pressed")
    }
}

//MARK: - Extensions

extension StorefontController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let controller = SearchController()
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        
        self.present(navigationController, animated: true, completion: nil)
        
        return false
    }
}

extension StorefontController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CollectionViewModel.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch CollectionViewModel(rawValue: section) {
        case .promoSection:
            return colors.count
        case .smallMenuSection:
            return 10
        case .productSection:
            return colors2.count
        case .productSecondSection:
            return colors2.count
        default:
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        let cell = collectionModel[section].createCell(collectionView: collectionView, indexPath: indexPath)
        
        switch CollectionViewModel(rawValue: section) {
        case .promoSection:
            return cell
        case .smallMenuSection:
            return cell
        case .productSection:
            return cell
        case .productSecondSection:
            return cell
        case .productHorizontal:
            return cell
        case .none:
            return UICollectionViewCell()
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y > 0 {
            
            UIView.animate(withDuration: 0.0, animations: {
                self.loveBarButton.tintColor = .systemGray4
                self.messageBarButton.tintColor = .systemGray4
                self.notificationBarButton.tintColor = .systemGray4
                self.navigationController?.navigationBar.backgroundColor = .white
                self.searchBar.searchTextField.backgroundColor = .systemGray4
                self.changeStatusBarBackgroundColor(color: .white)
                
            }, completion: nil)
            
            
        } else {
            
            UIView.animate(withDuration: 0.3, animations: {
                self.navigationController?.navigationBar.backgroundColor = .clear
                self.searchBar.searchTextField.backgroundColor = .white
                self.loveBarButton.tintColor = .white
                self.messageBarButton.tintColor = .white
                self.notificationBarButton.tintColor = .white
                self.changeStatusBarBackgroundColor(color: .clear)
            }, completion: nil)
            
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let section = indexPath.section
        let reusableView = collectionModel[section].createReusableView(collectionView: collectionView, indexPath: indexPath, kind: kind)
        
        switch CollectionViewModel(rawValue: section) {
        case .promoSection:
            return reusableView
        case .smallMenuSection:
            return reusableView
        case .productSection:
            return reusableView
        case .productSecondSection:
            return reusableView
        case .productHorizontal:
            return reusableView
        default:
            return UICollectionReusableView()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 50, left: 50, bottom: 50, right: 50)
    }
    
}
