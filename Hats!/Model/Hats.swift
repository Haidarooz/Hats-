//
//  Hats.swift
//  Hats!
//
//  Created by Haidar Mohammed on 5/2/19.
//  Copyright © 2019 Haidar AlOgaily. All rights reserved.
//

import Foundation


struct Response: Decodable {
    let products: [Hat]
    
}

struct Hat: Decodable {
    
    let id: Int?
    let imageUrl: String?
    let title: String?
    let price: Int?
    let description: String?
    let sizes : [String]
    let seller : Seller
}

