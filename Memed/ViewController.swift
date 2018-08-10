//
//  ViewController.swift
//  Memed
//
//  Created by Robin Heathcote on 10/08/2018.
//  Copyright © 2018 Robin Heathcote. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    let memeTextAttributes:[String: Any] = [
        NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
        NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedStringKey.strokeWidth.rawValue: 1.0
    ]
    

    @IBOutlet var imagePickerView: UIImageView!
    @IBOutlet var topTextField: UITextField!
    @IBOutlet var bottomTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextField.defaultTextAttributes = memeTextAttributes
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == topTextField {
            topTextField.text = ""
        } else if textField == bottomTextField {
            bottomTextField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   



    @IBAction func pickAnImage(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
            topTextField.text = "Top"
            topTextField.textAlignment = NSTextAlignment.center
            bottomTextField.textAlignment = NSTextAlignment.center
            bottomTextField.text = "Bottom"
            dismiss(animated: true, completion: nil)
        }
        
    }
}

