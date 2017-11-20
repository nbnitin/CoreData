//
//  TableViewCell.swift
//  CoreDataSample
//
//  Created by Umesh Chauhan on 17/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    var detail : extraDetails!
    var data : Person!{
        didSet{
            detail = extraDetails(detail:"\(data.fName!)  is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. End of text.")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
   
    override func layoutSubviews() {
        super.layoutSubviews()
       
        
        self.imageView?.layer.borderWidth = 1.0
        self.imageView?.layer.borderColor = UIColor.gray.cgColor
        self.imageView?.layer.cornerRadius = (min((self.imageView?.frame.width)!,(self.imageView?.frame.height)!))/2
        self.imageView?.clipsToBounds = true

    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
