//
//  DeathNoteCell.swift
//  deathNote_app
//
//  Created by Daniil KOZYR on 7/1/19.
//  Copyright © 2019 Daniil KOZYR. All rights reserved.
//

import UIKit

class DeathNoteCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var descriptionTextView: UITextView!
    
    func configure(with note: DeathNote) {
        nameLabel.text = note.name
        descriptionTextView.text = note.description
        dateLabel.text = note.time
    }
}
