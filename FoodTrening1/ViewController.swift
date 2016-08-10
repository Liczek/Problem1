//
//  ViewController.swift
//  FoodTrening1
//
//  Created by Pawel on 09.08.2016.
//  Copyright © 2016 LiczekCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK: Properties
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.clearsOnBeginEditing = true
        nameTextField.delegate = self
        nameTextField.returnKeyType = .Done
        
        //photoImageView.layer.cornerRadius = 15
        
        
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = nameTextField.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        
        nameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        presentViewController(imagePickerController, animated: true, completion: nil)
        imagePickerController.delegate = self
    }
    
    
    
    
    
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        
        mealNameLabel.text = "Meal name"
        nameTextField.text = nil
        nameTextField.placeholder = "Enter meal name again"
        
    }
    
    
    
    
    
    

}

