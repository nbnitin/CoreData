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

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet var lblDetails: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDetails[0].text = "Name : \t" + data.fName!
        lblDetails[1].text = "Age : \t \(data.age)"
        lblDetails[2].text = "Gender : \t" + data.gender!.uppercased()
        if let x = data.image as? UIImage {
            imgProfile.image = x
        } else {
            imgProfile.image = #imageLiteral(resourceName: "gender_neutral_user1600")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
