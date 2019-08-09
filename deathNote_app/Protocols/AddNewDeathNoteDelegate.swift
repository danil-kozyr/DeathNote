//
//  AddNewDeathNoteDelegate.swift
//  deathNote_app
//
//  Created by Daniil KOZYR on 7/2/19.
//  Copyright © 2019 Daniil KOZYR. All rights reserved.
//

import Foundation

protocol AddNewDeathNoteDelegate: AnyObject {
    func didCreateNewNote(_ note: DeathNote)
}
