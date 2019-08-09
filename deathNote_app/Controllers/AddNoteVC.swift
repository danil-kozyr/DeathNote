//
//  AddNoteViewController.swift
//  deathNote_app
//
//  Created by Daniil KOZYR on 7/1/19.
//  Copyright © 2019 Daniil KOZYR. All rights reserved.
//

import UIKit

class AddNoteVC: UIViewController {
    
    private enum Constants {
        static let placeholderText = "••••••••••"
        static let placeholderEmoji = "🧟‍♂️"
        static let nameCharacterLimit = 30
        static let descriptionCharacterLimit = 200
        static let maximumLines = 5
        static let dateFormat = "d MMM yyyy HH:mm"
        static let localeIdentifier = "en_GB"
    }
    
    weak var delegate: AddNewDeathNoteDelegate?
    
    private let datePicker = UIDatePicker()
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        return formatter
    }()
    
    @IBOutlet private weak var descriptionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var nameField: UITextField! {
        didSet {
            nameField.delegate = self
        }
    }
    @IBOutlet private weak var descriptionView: UITextView! {
        didSet {
            descriptionView.delegate = self
        }
    }
    @IBOutlet private weak var dateField: UITextField! {
        didSet {
            dateField.inputView = datePicker
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDatePicker()
    }
    
    @IBAction private func onTouchDoneButton(_ sender: UIBarButtonItem) {
        guard let name = nameField.text, !name.isEmpty else {
            showAlert(title: "Error", message: "Fill Name Field")
            return
        }
        
        guard var description = descriptionView.text else { return }
        guard let date = dateField.text else { return }
        
        if description == Constants.placeholderText {
            description = Constants.placeholderEmoji
        }
        
        let newDeathNote = DeathNote(name: name, description: description, time: date)
        delegate?.didCreateNewNote(newDeathNote)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        let toolbar = createKeyboardToolbar()
        nameField.inputAccessoryView = toolbar
        dateField.inputAccessoryView = toolbar
        descriptionView.inputAccessoryView = toolbar
        
        descriptionView.text = Constants.placeholderText
        descriptionView.textColor = .lightGray
        descriptionView.textContainer.maximumNumberOfLines = Constants.maximumLines
        
        dateField.tintColor = .clear
        dateField.text = dateFormatter.string(from: Date())
    }
    
    private func setupDatePicker() {
        datePicker.locale = Locale(identifier: Constants.localeIdentifier)
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }
    
    @objc private func doneClicked() {
        view.endEditing(true)
    }
    
    @objc private func datePickerValueChanged() {
        dateField.text = dateFormatter.string(from: datePicker.date)
    }
    
    private func createKeyboardToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneClicked)
        )
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        return toolbar
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension AddNoteVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return range.location < Constants.nameCharacterLimit
    }
}

extension AddNoteVC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return range.location < Constants.descriptionCharacterLimit
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = Constants.placeholderText
            textView.textColor = .lightGray
        }
    }
}
