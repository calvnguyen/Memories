//
//  DetailsTableViewControllerDelegate.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/22/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//


import UIKit

protocol DetailsTableViewControllerDelegate: class {
    
    func cancelButtonDetailsPressed(by controller: DetailsTableViewController)
    
    // Taken from CancelButtonDelegate file, and altered to match pattern.
    // NOTE: You will need to update AddItemTableViewController to make the Cancel Button work
}
