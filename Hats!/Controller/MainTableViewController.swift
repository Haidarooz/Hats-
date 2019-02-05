//
//  MainTableViewController.swift
//  Hats!
//
//  Created by Haidar Mohammed on 5/2/19.
//  Copyright © 2019 Haidar AlOgaily. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    //this list of hats
    var listOfHats : [Hat]?
    //the hat to view if a cell is clicked
    var hatToView : Hat?
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        parseJSON(from: "https://wemakeapps.net/hats/products.json")

    }

    func setupView(){
        
        //modifying the navigation bar
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Futura", size: 24)!]

    }
    
    //parsingJSON
    func parseJSON(from url: String){
        
        do {
            let data = try Data(contentsOf: URL(string: url)!, options: .mappedIfSafe)
            let jsonResult = try JSONDecoder().decode(Response.self, from: data)
            
            listOfHats = jsonResult.products
            table.reloadData()
            
        } catch {
            print(error)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //if there are hats return the count to initialize the table..
        if let hats = listOfHats {
            return hats.count
        }
        else {
            return 0
        }
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HatCell") as! HatCell
        
        //setting the variables of the hat cell
        cell.hatID = listOfHats![indexPath.row].id
        cell.hatPrice.text = "$\(listOfHats![indexPath.row].price!)"
        cell.hatTitle.text = "\(listOfHats![indexPath.row].title!)"
        cell.hatDescription.text = "\(listOfHats![indexPath.row].description!)"
        cell.hatSeller.text = "\(listOfHats![indexPath.row].seller.name!)"
        ImageService.getImage(withURL: URL(string: listOfHats![indexPath.row].imageUrl!)!){ image in
            
            if let anImage = image {
                cell.hatImage?.image = anImage
               
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        hatToView = listOfHats![indexPath.row]
        performSegue(withIdentifier: "next", sender: self)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let secondVC = segue.destination as? DescriptionViewController {
            //setting the next hat-to-view in the next view controller
            secondVC.aHat = hatToView
            
        }
        
    }


}
