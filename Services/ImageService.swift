//
//  ImageService.swift
//  Hats!
//
//  Created by Haidar Mohammed on 5/2/19.
//  Copyright © 2019 Haidar AlOgaily. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    
    //Caching image
    static let cache = NSCache<NSString,UIImage>()
    
    //only downloading image if its not cached
    static func downloadImage(withURL url:URL, completion: @escaping (_ image: UIImage?) ->()){
        
        let dataTask = URLSession.shared.dataTask(with: url){ data, responseURL, error in
            var downloadedImage : UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
            
        }
        
        dataTask.resume()
    }
    
    //retrieving from cache, else downloading image and caching it
    static func getImage(withURL url:URL, completion: @escaping (_ image: UIImage?) ->()){
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
        }
        else {
            downloadImage(withURL: url, completion: completion)
        }
    }
}


