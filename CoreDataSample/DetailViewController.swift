//
//  DetailViewController.swift
//  CoreDataSample
//
//  Created by Umesh Chauhan on 17/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data : Person!

    @IBOutlet weak var lblExtraDetial: UILabel!
    @IBOutlet weak var detialContainerHeight: NSLayoutConstraint!
    var oldHeight : CGFloat = 0.0
    @IBOutlet weak var btnShowDetail: UIBarButtonItem!
    @IBOutlet weak var detialContainer: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet var lblDetails: [UILabel]!
    var userExtraDetials : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oldHeight = detialContainerHeight.constant
        lblDetails[0].text = "Name : \t" + data.fName!
        lblDetails[1].text = "Age : \t \(data.age)"
        lblDetails[2].text = "Gender : \t" + data.gender!.uppercased()
        if let x = data.image as? UIImage {
            imgProfile.image = x
        } else {
            imgProfile.image = #imageLiteral(resourceName: "gender_neutral_user1600")
        }
        detialContainer.isHidden = true
        btnShowDetail.title = "Show Detial"
        detialContainerHeight.constant = 0.0
        detialContainerHeight.priority = .defaultHigh
        lblExtraDetial.text = userExtraDetials
        
        setAtrributtedTextToLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnShowDetial(_ sender: Any) {
        if(detialContainer.isHidden){
            detialContainer.isHidden = false
            btnShowDetail.title = "Hide Detials"
            detialContainerHeight.constant = oldHeight
            detialContainerHeight.priority = .init(100.0)
        } else {
            detialContainerHeight.constant = 0.0
            detialContainer.isHidden = true
            btnShowDetail.title = "Show Detials"
            detialContainerHeight.priority = .defaultHigh
        }
    }
    
    func setAtrributtedTextToLabel(){
        //Mark: setting textview attribute
        let text = lblExtraDetial.text
        let style = NSMutableParagraphStyle()
        style.alignment = .justified
        let attributes = [NSAttributedStringKey.paragraphStyle: style]
        
        let range = (text! as NSString).range(of: data.fName!)
        let range2 = (text! as NSString).range(of: "End of text.")
        
        let attribute = NSMutableAttributedString.init(string: text!)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red: 61/255.0, green: 179/255.0, blue: 115/255.0, alpha: 1.0) , range: range)
        attribute.addAttributes(attributes, range: range)
        attribute.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.red , range: range2)
        attribute.addAttributes(attributes, range: range2)
        
        lblExtraDetial.attributedText = attribute
    }
    
    

}
