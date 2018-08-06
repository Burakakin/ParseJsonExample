//
//  ViewController.swift
//  ParseJsonExample
//
//  Created by Burak Akin on 16.07.2018.
//  Copyright © 2018 Burak Akin. All rights reserved.
//

import UIKit


struct Album: Decodable {
    let name: String
    let artist: Artist
    let tracks: [Track]
}

struct Track: Decodable {
    let duration: Int
    let name: String
}

struct Artist: Decodable {
    let founded: Int
    let name: String
    let members: [String]
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  var apps = [App]()
        
        let url = URL(string: "http://www.json-generator.com/api/json/get/bVFwrzeIHS?indent=2")
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            guard let data = data else { return }
            do{
                let appData = try JSONDecoder().decode(Album.self, from: data)
                print(appData.tracks[0].name)
                
              
                
            }catch let err{
                
                print("Error",err)
            }
            
            
        }.resume()
    }

 

    
    
    

}

