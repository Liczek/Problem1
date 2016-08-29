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
        mealNameTextField.keyboardAppearance = .Dark
        mealNameTextField.returnKeyType = .Done
        mealNameTextField.clearsOnBeginEditing = true
        
        mealPhoto.layer.borderWidth = 1
        mealPhoto.layer.borderColor = UIColor.grayColor().CGColor
        mealPhoto.userInteractionEnabled = true
        
        mealNameLabel.textColor = UIColor.blackColor()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    //MARK: Actions
    
    
    @IBAction func setNewMealPhotoPicker(sender: UITapGestureRecognizer) {
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    

    @IBAction func setDefaultMealName(sender: UIButton) {
        mealNameLabel.text = "New Meal Name"
        mealNameLabel.textColor = UIColor.blackColor()
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        mealNameLabel.text = textField.text?.capitalizedString
        mealNameLabel.textColor = UIColor.redColor()
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text?.capitalizedString
        textField.text = nil
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        mealPhoto.image = pickedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
       
        dismissViewControllerAnimated(true, completion: nil)
    }

}

