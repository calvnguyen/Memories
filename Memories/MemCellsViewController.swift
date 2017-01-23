//
//  ViewController.swift
//  Memories
//
//  Created by Calvin Nguyen on 1/18/17.
//  Copyright © 2017 Calvin Nguyen. All rights reserved.
//

import UIKit
import CoreData

class MemCellsViewController: UITableViewController, AddMemTableViewControllerDelegate, DetailsTableViewControllerDelegate {
    
    var memory_items: [Memory] = []
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var pictures = ["ken", "husky", "gtr", "pooh", "ninja", "tiger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let memory = NSEntityDescription.insertNewObject(forEntityName: "Memory", into: managedObjectContext) as! Memory
//
//        memory.image_name = "mario"
//        memory.title = "Mario"
//        memory.my_description = "MaMa Mia!"
//
//        if managedObjectContext.hasChanges {
//            do {
//                try managedObjectContext.save()
//                print("Success")
//            } catch {
//                print("\(error)")
//            }
 //       }

        
        fetchAllMemories()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "memCell") as! MemCell
        
        cell.memImage.image = UIImage(named: memory_items[indexPath.row].image_name!)
        cell.nameLabel.text = memory_items[indexPath.row].title
        cell.delegate = self
        
        
//        cell.memImage.contentMode = .scaleAspectFit
        // return cell so that Table View knows what to draw in each row
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memory_items.count
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // removal of items
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            managedObjectContext.delete(memory_items[indexPath.row])
            
            if managedObjectContext.hasChanges {
                do
                {
                    try managedObjectContext.save()
                    print("Success Deleting an item to core data")
                } catch
                {
                    print("\(error)")
                }
            }
            
            
            memory_items.remove(at: indexPath.row)
            
            tableView.reloadData()
        }
        
    }

    
    
    @IBAction func viewDescriptionPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showMemory", sender: sender)
      
    }
 
    
    // prepare the segue to specify as delegate
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        if(segue.identifier == "addMemory"){
            
            let addMemTableController = navigationController.topViewController as! AddMemTableViewController
            addMemTableController.delegate = self
            
            
        }
        else if (segue.identifier == "showMemory"){
            let detailsTableController = navigationController.topViewController as! DetailsTableViewController
            detailsTableController.delegate = self
            let indexPath: IndexPath
            if let this_button = sender as? UIButton{
                let cell = this_button.superview?.superview as! UITableViewCell
                indexPath = tableView.indexPath(for: cell)!
                print(indexPath)
                let item = memory_items[indexPath.row]
                detailsTableController.edit_memory = item
            }
            
        }
        
    }

    // cancel button from Add item view
    func cancelButtonPressed(by controller: AddMemTableViewController) {
        
        print("cancel button pressed - i'm the delegate of AddMemTableViewController")
        dismiss(animated: true, completion: nil)
        
    }
    
    
    // cancel button from Details screen
    func cancelButtonDetailsPressed(by controller: DetailsTableViewController) {
        print("cancel button pressed - i'm the delegate of DetailsTableViewController")
        dismiss(animated: true, completion: nil)
    }
    
    func memAdded(by controller: AddMemTableViewController, with title: String, with image_name: String, with description: String) {
        
        let memories = NSEntityDescription.insertNewObject(forEntityName: "Memory", into: managedObjectContext) as! Memory
        
        memories.title = title
        memories.image_name = image_name
        memories.my_description = description
        
        
        // need to commit the changes first to record data
        if managedObjectContext.hasChanges {
            do
            {
                try managedObjectContext.save()
                print("Success Editing an memory item to core data")
            } catch
            {
                print("\(error)")
            }
        }
        
        
        fetchAllMemories()
        tableView.reloadData()
        
        dismiss(animated: true, completion: nil)
    }
    
    func memEdited(by controller: AddMemTableViewController, with title: String, with image_name: String, with description: String, on mem: Memory) {
        
        // edit the item
        mem.image_name = image_name
        mem.title = title
        mem.my_description = description
    
        
        // need to commit the changes first to record data
        if managedObjectContext.hasChanges {
            do
            {
                try managedObjectContext.save()
                print("Success Editing a memory item to core data")
            } catch
            {
                print("\(error)")
            }
        }
        
        
        fetchAllMemories()
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    // populate the items of the List to display on screen
    func fetchAllMemories(){
        let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Memory")
        do {
            let results = try managedObjectContext.fetch(userRequest)
            memory_items = results as! [Memory]
        } catch {
            print("\(error)")
        }
    }



}

