//
//  addMemTableViewController.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit

class AddMemTableViewController: UITableViewController, ImageCollectionViewControllerDelegate{

    @IBOutlet weak var nameTextBox: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var selectedImage: UIImageView!

    weak var delegate: AddMemTableViewControllerDelegate?

    var add_title: String?
    var add_image: String?
    var add_description: String?
    var edit_memory: Memory?
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let this_item = edit_memory{
            print("edit item is \(this_item)")
            nameTextBox.text = this_item.title
            descriptionTextView.text = this_item.my_description
            selectedImage.image = UIImage(named: this_item.image_name!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        if let this_delegate = delegate{
            print("Found delegate \(this_delegate)")
        }
        else{
            print("no delegate")
        }
        delegate?.cancelButtonPressed(by: self)
        
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        print("done clicked")
        if let this_title = nameTextBox.text{
            add_title = this_title
        }
        
        if let this_description = descriptionTextView.text{
            add_description = this_description
        }
        
        if let this_delegate = delegate{
            print("Found delegate \(this_delegate)")
        }
        else{
            print("no delegate")
        }
        
        if let this_memory = edit_memory{
            print("editing now")
            if let this_image = add_image{
                delegate?.memEdited(by : self, with: add_title!, with : this_image, with: add_description!, on: this_memory)
            }
            else{
                delegate?.memEdited(by : self, with: add_title!, with : this_memory.image_name!, with: add_description!, on: this_memory)
            }
        }
        else{
            print("adding now")
            delegate?.memAdded(by: self, with: add_title!, with: add_image!, with: add_description!)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let image_controller = segue.destination as! ImageCollectionViewController
        image_controller.delegate = self
    
    }
    
    func imageSelected(by controller: ImageCollectionViewController, with image_name: String){

        print("in image selected, name is \(image_name)")
        add_image = image_name
        selectedImage.image = UIImage(named: image_name)
        
    }
    
    @IBAction func unwindToAddViewController(segue: UIStoryboardSegue) {
        print("Unwind to add View Controller")
    }
    
    
}
