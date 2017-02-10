//
//  shoppinglistTableViewController.swift
//  ShoppingList
//
//  Created by Hayden Hastings on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class shoppinglistTableViewController: UITableViewController, shoppinglistButtonTableViewCellDelegate {
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Items", message: "Enter the list of items you need to get", preferredStyle: .alert)
        
        var listTitleTextField: UITextField?
        
        alertController.addTextField { (textField) in
            listTitleTextField = textField
        }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let list = listTitleTextField?.text else { return }
            ShoppinglistController.sharedController.createShoppingListWith(title: list)
            
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppinglistController.sharedController.lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppinglistCell", for: indexPath) as? ShoppinglistCell else { return UITableViewCell() }
            let shoppinglist = ShoppinglistController.sharedController.lists[indexPath.row]
        
        cell.lists = shoppinglist
        cell.delegate = self
        
        return cell
    }
    
    func shoppinglistButtonTapped(sender: ShoppinglistCell) {
        guard let list = sender.lists, let indexPath = tableView.indexPath(for: sender) else { return }
        ShoppinglistController.sharedController.update(list: list)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let list = ShoppinglistController.sharedController.lists[indexPath.row]
            
            ShoppinglistController.sharedController.delete(list: list)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}



