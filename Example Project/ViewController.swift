//
//  ViewController.swift
//  Example Project
//
//  Created by Barkha Maheshwari on 12/10/20.
//  Copyright © 2020 Barkha Maheshwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

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
    //MARK: UIImagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        photoImageView.image = image
        dismiss(animated: true, completion: nil)
    }

    //MARK: Actions

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Meal"
    }

    @IBAction func selectImageFromPhotoLibrart(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()

        let imagePickerController = UIImagePickerController()
        //Only picks photo from library, not allowing to take photos
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

}
