//
//  memoryImageCell.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit


class memoryImageCell: UICollectionViewCell{
    
    @IBOutlet weak var imageItem: UIImageView!
    weak var delegate: UIImagePickerControllerDelegate?
    
}


