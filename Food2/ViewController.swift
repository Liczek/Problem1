//
//  ViewController.swift
//  Food2
//
//  Created by Pawel on 29.08.2016.
//  Copyright © 2016 LiczekCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK: Properties
    
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var mealPhoto: UIImageView!
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealNameTextField.delegate = self
        mealNameTextField.keyboardAppearance = .dark
        mealNameTextField.returnKeyType = .done
        mealNameTextField.clearsOnBeginEditing = true
        
        mealPhoto.layer.borderWidth = 1
        mealPhoto.layer.borderColor = UIColor.gray.cgColor
        mealPhoto.isUserInteractionEnabled = true
        
        mealNameLabel.textColor = UIColor.black
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    //MARK: Actions
    
    
    @IBAction func setNewMealPhotoPicker(_ sender: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
        
    }
    

    @IBAction func setDefaultMealName(_ sender: UIButton) {
        mealNameLabel.text = "New Meal Name"
        mealNameLabel.textColor = UIColor.black
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealNameLabel.text = textField.text?.capitalized
        mealNameLabel.textColor = UIColor.red
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text?.capitalized
        textField.text = nil
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        mealPhoto.image = pickedImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
       
        dismiss(animated: true, completion: nil)
    }

}

