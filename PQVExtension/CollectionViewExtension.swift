//
//  CollectionviewExtension.swift
//  PQVExtension
//
//  Created by VU on 8/7/19.
//  Copyright © 2019 VuPham. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    // setup collection view using auto layout for cell
    @available(iOS 10.0, *)
    @discardableResult func pqvSetupAutoLayoutCell()-> UICollectionView {
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        return self
    }
    
    // setup addition steps for collection view default layout, like interitem space, line spacing, etc
    
    @discardableResult func pqvSetupDefaulLayout(additionalSetupFunc : ((UICollectionViewFlowLayout)->())) -> UICollectionView{
        if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            additionalSetupFunc(layout)
        }
        return self
    }
    
    // register cell with a list of nib (set bundle if nibs are in another bundle)
    func pqvRegisterCellNib(nibNames : String..., bundle : Bundle? = nil) {
        for nibName in nibNames {
            self.register(UINib(nibName: nibName, bundle: bundle), forCellWithReuseIdentifier: nibName)
        }
    }
    
    // register supplementary view with a list of nib (set bundle if nibs are in another bundle)
    func pqvRegisterNib(nibNames : String..., forSupplementaryViewOfKind : String, bundle : Bundle? = nil) {
        for nibName in nibNames {
            self.register(UINib(nibName: nibName, bundle: bundle), forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: nibName)
        }
    }
    
    func pqvDequeue<T : UICollectionViewCell>(cellType : T.Type, at indexPath: IndexPath, configBlock : ((T)->())?)-> UICollectionViewCell {
        let generalCell = self.dequeueReusableCell(withReuseIdentifier: T.pqvDefaultIdentifier(), for: indexPath)
        guard let specificCell = generalCell as? T else { return generalCell}
        configBlock?(specificCell)
        return specificCell
    }
}
