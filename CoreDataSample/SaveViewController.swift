//
//  SaveViewController.swift
//  CoreDataSample
//
//  Created by Umesh Chauhan on 15/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var btnGetImage: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var segGender: UISegmentedControl!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtName: UITextField!
    var gender : String = ""
    var picker:UIImagePickerController?=UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSave.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        gender = "M"
        picker?.delegate = self
        btnGetImage.addTarget(self, action: #selector(getImageOption(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func segGenderAction(_ sender: Any) {
        let index = segGender.selectedSegmentIndex
        gender = index == 0 ? "M" : "F"
    }
    
    @objc func saveData(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
        
        
        
        // 3
        
        
            let person = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
        
        let dict = ["fName":txtName.text!,"age":NSNumber(value:Int(txtAge.text!)!),"gender":gender,"image":imgProfile.image!] as [String : Any]
            person.setValuesForKeys(dict)
            // 4
            do {
                try managedContext.save()
                self.clear()
                // people.append(person)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        
    }
    
    
    @objc func getImageOption(_ sender: Any){
       
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        let alertCameraAction = UIAlertAction(title: "Camera", style: .default, handler:{ (UIAlertAction) in self.openCamera()})
        let alertGalleryAction = UIAlertAction(title: "Gallery", style: .default, handler: {(UIAlertAction) in self.openGallery()})
        let alertCancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(alertCameraAction)
        alert.addAction(alertGalleryAction)
        alert.addAction(alertCancelAction)
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: (self.view?.frame.midX)!, y: (self.view?.frame.midY)!, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }

        self.present(alert, animated: true, completion: nil)
        
    }
    
    func openCamera(){
        
    }
    
    func openGallery(){
        picker!.allowsEditing = true
        picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        present(picker!, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        imgProfile.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    

    func clear(){
        txtAge.text = ""
        txtName.text = ""
        gender = "M"
        segGender.selectedSegmentIndex = 0
        imgProfile.image = #imageLiteral(resourceName: "gender_neutral_user1600")
    }
    
}

