//
//  HatCell.swift
//  Hats!
//
//  Created by Haidar Mohammed on 5/2/19.
//  Copyright © 2019 Haidar AlOgaily. All rights reserved.
//

import UIKit

class HatCell: UITableViewCell {

 
    @IBOutlet var hatSeller: UILabel!
    @IBOutlet var hatTitle: UILabel!
    @IBOutlet var hatPrice: UILabel!
    @IBOutlet var hatDescription: UILabel!
    @IBOutlet var hatImageBG: UIView!
    var hatID : Int?

    @IBOutlet var hatImage: UIImageView! {
        
        didSet{
            //rounding the corners as soon as the image loads
            hatImage.contentMode = .scaleAspectFit
            hatImage.clipsToBounds = true
            hatImage.layer.cornerRadius = 35
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //customizing cell
        hatImageBG.layer.cornerRadius = 40
        hatImageBG.backgroundColor = UIColor.white
        hatImageBG.layer.shadowOffset = CGSize(width: -1, height: 1)
        hatImageBG.layer.shadowOpacity = 0.2
        
    }

}
