//
//  CollectionViewCell.swift
//  demoCollectionView
//
//  Created by AgribankCard on 2/15/17.
//  Copyright © 2017 cuongpc. All rights reserved.
//

import UIKit
import PhotosUI
import Photos
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var uiLabel: UILabel!
    var representedAssetIdentifier: String!
    @IBOutlet weak var imageView: UIImageView!
    
    var thumbnailImage: UIImage! {
        didSet {
            imageView.image = thumbnailImage
        }
    }
    
    
}
