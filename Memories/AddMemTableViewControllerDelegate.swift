//
//  AddItemTableViewControllerDelegate.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

protocol AddMemTableViewControllerDelegate: class {
    
    func memAdded(by controller: AddMemTableViewController, with title: String, with image_name: String, with description: String)
    
    func memEdited(by controller: AddMemTableViewController, with title: String, with image_name: String, with description: String, on mem: Memory)
    
    func cancelButtonPressed(by controller: AddMemTableViewController)
    
    // Taken from CancelButtonDelegate file, and altered to match pattern.
    // NOTE: You will need to update AddItemTableViewController to make the Cancel Button work
}

