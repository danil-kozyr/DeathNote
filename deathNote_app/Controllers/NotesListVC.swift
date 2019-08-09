//
//  ViewController.swift
//  deathNote_app
//
//  Created by Daniil KOZYR on 7/1/19.
//  Copyright © 2019 Daniil KOZYR. All rights reserved.
//

import UIKit

class NotesListVC: UIViewController {
    
    private enum Constants {
        static let cellIdentifier = "deathNoteCellIdentifier"
        static let createNewNoteSegue = "createNewNoteSegue"
        static let estimatedRowHeight: CGFloat = 100
    }
    
    private var notes: [DeathNote] = []

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        initializeSampleData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTableView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.createNewNoteSegue {
            guard let addNoteVC = segue.destination as? AddNoteVC else { return }
            addNoteVC.delegate = self
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = Constants.estimatedRowHeight
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func initializeSampleData() {
        notes = [
            DeathNote(
                name: "Kurt Cobain",
                description: "I don't have the passion anymore, and so remember, it's better to burn out than to fade away.",
                time: "12 Jul 2039 15:53"
            ),
            DeathNote(
                name: "Jiah Khan",
                description: "I don't know why destiny brought us together. After all the pain, the rape, the abuse, the torture I have seen previously I didn't deserve this.",
                time: "23 Jun 2049 12:13"
            ),
            DeathNote(
                name: "Vincent Van Gogh",
                description: "The sadness will last forever.",
                time: "28 Feb 2033 02:23"
            ),
            DeathNote(
                name: "Marilyn Monroe",
                description: "I sound crazy, but I think I'm going crazy. I get before a camera and my concentration and everything I'm trying to learn leaves me. Then I feel like I'm not existing in the human race at all.",
                time: "01 Jun 2020 22:00"
            ),
            DeathNote(
                name: "Robin Williams",
                description: "I'm done with that. Time to go. No more to come.",
                time: "01 Jun 2020 22:00"
            )
        ]
    }
}

extension NotesListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? DeathNoteCell else {
            return UITableViewCell()
        }
        
        let note = notes[indexPath.row]
        cell.configure(with: note)
        return cell
    }
}

extension NotesListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        notes.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension NotesListVC: AddNewDeathNoteDelegate {
    
    func didCreateNewNote(_ note: DeathNote) {
        notes.append(note)
        let indexPath = IndexPath(row: notes.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
