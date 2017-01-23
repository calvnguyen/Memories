//
//  DetailsTableViewController.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController{
    
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    weak var delegate: DetailsTableViewControllerDelegate?

    var edit_memory: Memory?
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let this_item = edit_memory{
    
            showImage.image = UIImage(named: this_item.image_name!)
            titleLabel.text = this_item.title
            descriptionLabel.text = this_item.my_description
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonIsPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonDetailsPressed(by: self)
    }
    
    
    // pass the memory info to the add view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        if (segue.identifier == "editMemory"){
            print("show segue initiated")
            let addMemTableController = navigationController.topViewController as! AddMemTableViewController
            // pass the delegate along to go back to MemCellsViewController for updates
            addMemTableController.delegate = delegate as! AddMemTableViewControllerDelegate?
            if let this_item = edit_memory{
                addMemTableController.edit_memory = this_item
            }
            
            
        }
        
    }
    

}

