//
//  Shoppinglist+Convenience.swift
//  ShoppingList
//
//  Created by Hayden Hastings on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation
import CoreData

extension List {
    @discardableResult convenience init(list: String, inCart: Bool = false, context: NSManagedObjectContext = Stack.context) {
        self.init(context: context)
        
        self.list = list
        self.inCart = inCart
        
    }
}
