//
//  Functions.swift
//  JsonFetchTest
//
//  Created by Richard Hong on 12/27/16.
//  Copyright © 2016 Richard Hong. All rights reserved.
//

import Foundation

func fetchTumblrPostForSurfView (startsAt: String) {
    let urlString = "https://accesscontrolalloworiginall.herokuapp.com/http://api.tumblr.com/v2/blog/bitchy-richey/posts/photo?api_key=pl0d2Wr9elnXn01VpdU6FziPQxQK13fTLk8CTRpN7tZBCPOd8h&limit=20&offset=\(startsAt)"
    
    DispatchQueue.global(qos: .userInitiated).sync { _ in
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                
                let json = JSON(data:data)
                
                if json["meta"]["status"].intValue == 200 {
                    
                    let images = json["response"]["posts"]
                    
                    for (dictKey, post) in images {
                        posts.append("\(post["photos"][0]["original_size"]["url"])")
                    }
                }
            }
        }
    }
}


func addToClosetFunction() {
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let path = dir.appendingPathComponent(file)
        
        if (currentURL != "") {
        
            var alreadyAddedIndicator = "New Item"
            
            for each in closetArray {
                if (currentURL == each) {
                    alreadyAddedIndicator = "Old Item"
                }
            }
            
            if (alreadyAddedIndicator == "New Item") {
                closetArray.append(currentURL)
                print(closetArray)
            } else {
                print("item has already been added")
                //be ready to set up the alert message saying that "already in closet"
            }
            
            do {
                let jsonData:Data = try JSONSerialization.data(withJSONObject: closetArray, options: .prettyPrinted)
                try jsonData.write(to: path)
            }
                
            catch {
                print("Error occured while saving to the file path. Please debug")
            }
        }
    }
}

