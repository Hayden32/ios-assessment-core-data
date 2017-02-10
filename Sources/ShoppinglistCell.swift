//
//  ShoppinglistCell.swift
//  ShoppingList
//
//  Created by Hayden Hastings on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppinglistCell: UITableViewCell {
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    weak var delegate: shoppinglistButtonTableViewCellDelegate?
    
    var lists: List? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let list = lists else { listLabel.text = ""; return }
        listLabel.text = list.list
        
        let image = list.inCart ? #imageLiteral(resourceName: "USA Flag") : #imageLiteral(resourceName: "EmptyStar")
        checkBoxButton.setImage(image, for: .normal)
    }
    
    @IBAction func checkBoxButtonTapped(_ sender: Any) {
        delegate?.shoppinglistButtonTapped(sender: self)
    }
    
}

protocol shoppinglistButtonTableViewCellDelegate: class {
    
    func shoppinglistButtonTapped(sender: ShoppinglistCell)
}
