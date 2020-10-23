//
//  LayoutBuilder.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/2/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

public class LayoutBuilder {
    
    public static func buildSliderSectionLayout(size: NSCollectionLayoutSize, itemInsets: NSDirectionalEdgeInsets = .zero, sectionInsets: NSDirectionalEdgeInsets = .zero) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = itemInsets
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 1)
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(32.0)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        footerView.pinToVisibleBounds = false
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInsets
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.boundarySupplementaryItems = [footerView]
        
        return section
    }
    
    public static func buildSmallMenuSectionLayout(size: NSCollectionLayoutSize, itemInsets: NSDirectionalEdgeInsets = .zero, sectionInsets: NSDirectionalEdgeInsets = .zero) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = itemInsets
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitem: item, count: 1)
        
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(66)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerView.pinToVisibleBounds = false
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInsets
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.boundarySupplementaryItems = [headerView]
        
        return section
    }
    
    public static func buildProductSectionLayout() -> NSCollectionLayoutSection {
        
        
        let smallItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let smallItemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitem: smallItem, count: 2)
        
        let smallItemMegaGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),heightDimension: .fractionalHeight(1.0)),subitem: smallItemGroup, count: 2)
        
        let bigItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(0.8)))
        
        
        let bigItemGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),heightDimension: .fractionalHeight(1.0)), subitem: bigItem, count: 1)
        
        let topMegaGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [bigItemGroup, smallItemMegaGroup])
        topMegaGroup.contentInsets = .zero
        
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerView.pinToVisibleBounds = false
        
        let gigaGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.4)), subitem: topMegaGroup, count: 1)
        
        let section = NSCollectionLayoutSection(group: gigaGroup)
        section.boundarySupplementaryItems = [headerView]
        
        return section
    }
    
    public static func buildProductSecondSectionLayout() -> NSCollectionLayoutSection {
        
        
        let smallItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let smallItemGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitem: smallItem, count: 2)
        
        let smallItemMegaGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),heightDimension: .fractionalHeight(1.0)),subitem: smallItemGroup, count: 2)
        
        let bigItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(0.8)))
        
        
        let bigItemGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),heightDimension: .fractionalHeight(1.0)), subitem: bigItem, count: 1)
        
        let topMegaGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)), subitems: [smallItemMegaGroup, bigItemGroup])
        topMegaGroup.contentInsets = .zero
        
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerView.pinToVisibleBounds = false
        
        let gigaGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.4)), subitem: topMegaGroup, count: 1)
        
        let section = NSCollectionLayoutSection(group: gigaGroup)
        section.boundarySupplementaryItems = [headerView]
        
        return section
    }
    
    public static func buildProductHorizontalSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1.5), heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = .init(top: 0.0, leading: 20.0, bottom: 20.0, trailing: 0.0)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1.2), heightDimension: .fractionalHeight(0.3)), subitem: item, count: 3)
        
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44.0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        headerView.pinToVisibleBounds = false
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.boundarySupplementaryItems = [headerView]
        
        return section
    }
}
