//
//  ImageCollectionViewDelegate.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/22/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

protocol ImageCollectionViewControllerDelegate: class {
    
    
    func imageSelected(by controller: ImageCollectionViewController, with image_name: String)
    
}
