//
//  CollectionViewController.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

class ImageCollectionViewController: UICollectionViewController {
    
    var images = ["ninja", "ken", "gtr", "husky", "pooh", "tiger", "ironman", "tigger", "49ers", "cat", "bike", "mario", "sonic", "pacman", "dojo", "eagle", "motorbike", "warriors"]
    
    weak var delegate: ImageCollectionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
       // editor placeholder in source file error was here..
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! memoryImageCell
        
        cell.imageItem.image = UIImage(named: images[indexPath.row])
        cell.imageItem.contentMode = .scaleAspectFit
        
        return cell
        
    }
    
    // pass the image's name back to the delegate. Exit the screen afterwards
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(indexPath.row)
        let image = images[indexPath.row]
        print(image)
        delegate?.imageSelected(by: self, with: image)
        performSegue(withIdentifier: "exitSeg", sender: self)
        
    }
    
    
}
