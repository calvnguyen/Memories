//
//  MemCell.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

class MemCell: UITableViewCell{
    @IBOutlet weak var memImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    weak var delegate: DetailsTableViewControllerDelegate?
    
    @IBAction func viewDescriptionPressed(_ sender: UIButton) {
        
    }
    
}
