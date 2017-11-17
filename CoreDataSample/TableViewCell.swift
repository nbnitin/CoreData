//
//  TableViewCell.swift
//  CoreDataSample
//
//  Created by Umesh Chauhan on 17/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    var data : Person!
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
