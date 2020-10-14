//
//  ViewController.swift
//  Example Project
//
//  Created by Barkha Maheshwari on 12/10/20.
//  Copyright © 2020 Barkha Maheshwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Handle the text's field user input through delegate callbacks.
        nameTextField.delegate = self
    }

    //MARK: UITextFieldDelegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        return true
    }

    //MARK: Actions

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Meal"
    }
}
