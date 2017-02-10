//
//  ShoppinglistController.swift
//  ShoppingList
//
//  Created by Hayden Hastings on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppinglistController {
    
    static let sharedController = ShoppinglistController()
    
    // CRUD
    
    //Create
    
    func createShoppingListWith(title: String) {
        let shoppinglist = List(list: title)
        saveToPersistentStore()
    }
    
    // Read
    var lists: [List] {
    
    let request: NSFetchRequest<List> = List.fetchRequest()
    let moc = Stack.context
        do {
            return try moc.fetch(request)
        } catch {
            return []
        }
    
    }
    // Update
    
    func update(list: List) {
        list.inCart = !list.inCart
        saveToPersistentStore()
    }
    
    
    
    // Delete
    
    func delete(list: List) {
        let moc = Stack.context
        
        delete(list: list)

        saveToPersistentStore()
    }
    
    
    
    
    
    
    func saveToPersistentStore() {
        let moc = Stack.context
        do {
            try moc.save()
        } catch {
            print("Could not save")
        }
    }
    
    
}
