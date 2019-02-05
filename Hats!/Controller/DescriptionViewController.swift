//
//  DescriptionViewController.swift
//  Hats!
//
//  Created by Haidar Mohammed on 5/2/19.
//  Copyright © 2019 Haidar AlOgaily. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    var aHat : Hat!
    
    @IBOutlet var hatSize: UILabel!
    @IBOutlet var hatID: UILabel!
    @IBOutlet var sellerID: UILabel!
    @IBOutlet var sellerName: UILabel!
    @IBOutlet var hatDescription: UILabel!
    @IBOutlet var hatImage: UIImageView!
    @IBOutlet var hatBGview: UIView!
    @IBOutlet var hatPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
 
    func setupView(){
    
        //modifying the image background view
        hatBGview.layer.cornerRadius = 40
        hatBGview.backgroundColor = UIColor.white
        hatBGview.layer.shadowOffset = CGSize(width: -1, height: 1)
        hatBGview.layer.shadowOpacity = 0.2
        hatImage.contentMode = .scaleAspectFit
        hatImage.clipsToBounds = true
        hatImage.layer.cornerRadius = 35
        
        //modifying the navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 24)!]
        self.navigationItem.title = aHat.title

        //setting up the values
        hatID.text = "Hat ID: \(aHat.id!)"
        sellerID.text = "ID \(aHat.seller.id!)"
        sellerName.text = "\(aHat.seller.name!)"
        hatDescription.text = "\(aHat.description!)"
        hatPrice.text = "$\(aHat.price!)"
        hatSize.text = getHatSizeTextFormatted(sizes: aHat.sizes)
        ImageService.getImage(withURL: URL(string: aHat.imageUrl!)!){ image in
            
            if let anImage = image {
                self.hatImage.image = anImage
            }
        }
        
        
    }
    
    //returning a foramtted string to shorten the text
    func getHatSizeTextFormatted(sizes listOfSizes: [String]?) -> String{
        
            var aString = ""
            for size in listOfSizes! {
                
                switch size {
                    
                case "Small" : aString.append("S, ") ;break
                case "Medium" : aString.append("M, ") ;break
                case "Large" : aString.append("L, ") ;break
                case "X Large" : aString.append("XL, ") ;break
                case "XX Large" : aString.append("XX, ") ;break

                default: aString.append(size)
                }
                
            }
        
            return aString
    
    

    }
    
}
