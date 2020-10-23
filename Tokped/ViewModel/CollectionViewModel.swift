//
//  CollectionViewModel.swift
//  Tokped
//
//  Created by Bayu Kurniawan on 9/2/20.
//  Copyright © 2020 Bayu Kurniawan. All rights reserved.
//

import UIKit

let colors = [
    UIColor.systemGreen,
    UIColor.systemBlue,
    UIColor.systemPink,
    UIColor.systemIndigo
]

var colors2 = [
    UIColor.systemGreen,
    UIColor.systemBlue,
    UIColor.systemPink,
    UIColor.systemIndigo,
    UIColor.systemTeal
]

enum CollectionViewModel: Int, CaseIterable {
    
    case promoSection
    case smallMenuSection
    case productSection
    case productSecondSection
    case productHorizontal
    
    var reuseIdentifier: String {
        switch self {
        case .promoSection:
            return "PromoCell"
        case .smallMenuSection:
            return "SmallMenuCell"
        case .productSection:
            return "ProductCell"
        case .productSecondSection:
            return "SecondProductCell"
        case .productHorizontal:
            return "ProductHorizontalCell"
        }
    }
    
    var reusableHeaderIdentifier: String {
        switch self {
        case .smallMenuSection:
            return "SmallMenuHeader"
        case .productSection:
            return "ProductHeader"
        case .productSecondSection:
            return "SecondProductHeader"
        case .productHorizontal:
            return "ProductHorizontalHeader"
        default:
            return ""
        }
    }
    
    var reusableFooterIdentifier: String {
        switch self {
        case .promoSection:
            return "PromoFooter"
        default:
            return ""
        }
    }
    
    func createCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        switch self {
        case .promoSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PromoCell
            cell.colors = colors[indexPath.row]
            return cell
            
        case .smallMenuSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SmallMenuCell
            return cell
        case .productSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCell
            cell.colors = colors2[indexPath.row]
            return cell
            
        case .productSecondSection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SecondProductCell
            cell.colors = colors2[indexPath.row]
            return cell
        
        case .productHorizontal:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductHorizontal
            
            return cell
        }
    }
    
    func createReusableView(collectionView: UICollectionView, indexPath: IndexPath, kind: String) -> UICollectionReusableView {
        
        let header = UICollectionView.elementKindSectionHeader
        let footer = UICollectionView.elementKindSectionFooter
        
        switch kind {
        case header:
            switch self {
            case .smallMenuSection:
                let reusableHeader = collectionView.dequeueReusableSupplementaryView(ofKind: header, withReuseIdentifier: reusableHeaderIdentifier, for: indexPath) as! SmallMenuHeaderReusableView
                
                return reusableHeader
            case .productSection:
                let reusableHeader = collectionView.dequeueReusableSupplementaryView(ofKind: header, withReuseIdentifier: reusableHeaderIdentifier, for: indexPath) as! ProductHeaderReusableView
                
                return reusableHeader
            case .productSecondSection:
                let reusableHeader = collectionView.dequeueReusableSupplementaryView(ofKind: header, withReuseIdentifier: reusableHeaderIdentifier, for: indexPath) as! SecondProductHeaderReusableView
                
                return reusableHeader
            
            case .productHorizontal:
                let reusableHeader = collectionView.dequeueReusableSupplementaryView(ofKind: header, withReuseIdentifier: reusableHeaderIdentifier, for: indexPath)
                reusableHeader.backgroundColor = .systemGray5
                return reusableHeader
            default:
                return UICollectionReusableView()
            }
        case footer:
            switch self {
            case .promoSection:
                let reusableFooter = collectionView.dequeueReusableSupplementaryView(ofKind: footer, withReuseIdentifier: reusableFooterIdentifier, for: indexPath) as! PromoFooterReusableView
                
                return reusableFooter
            default:
                return UICollectionReusableView()
            }
        default:
            return UICollectionReusableView()
        }
        
    }
}
