//
//  CollectionViewCellExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation


public extension UICollectionViewCell {
    
    // return collection view cell that has been registered with default identifier
//    static func pqvDequeueDefault<T : UICollectionViewCell>(from collectionView: UICollectionView, at indexPath: IndexPath)-> T? {
//        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.pqvDefaultIdentifier(), for: indexPath) as? T{
//            return cell
//        }
//        return nil
//    }
    
    // return automatic layout for overriding preferredLayoutAttributesFitting
    func pqvAutomaticLayout (_ layoutAttributes: UICollectionViewLayoutAttributes)-> UICollectionViewLayoutAttributes {
        let autoLayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        let autoLayoutSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.defaultLow)
        let autoLayoutFrame = CGRect(origin: autoLayoutAttributes.frame.origin, size: autoLayoutSize)
        autoLayoutAttributes.frame = autoLayoutFrame
        return autoLayoutAttributes
    }
}
