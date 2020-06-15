//
//  Heroi.swift
//  marvel-heroes
//
//  Created by Henrique Batista on 09/06/20.
//  Copyright © 2020 Henrique Batista. All rights reserved.
//

import UIKit

class Heroi: NSObject, NSCoding {
    // MARK: - Atributos
    let id: Int                         //   The unique ID of the character resource.
    let name: String                    //The name of the character.
    let heroDescription: String         // A short bio or description of the character.
    let thumbnail: String              // The representative image for this character.
//    let modified: Date                  //The date the resource was most recently modified.
//    let resourceURI: String? = nil      //The canonical URL identifier for this resource.
//    let urls: Array<String> = []        //[Url]    A set of public web site URLs for the resource.
//    let comics: Array<Any>           // A resource list containing comics which feature this character.
//    let stories: Array<String> = []     // A resource list of stories in which this character appears.
//    let events: Array<String> = []      // A resource list of events in which this character appears.
//    let series: Array<String> = []
    
    // MARK: - Init
    init(
        id: Int,
        name: String,
        heroDescription: String,
        thumbnail: String
    ) {
        self.id = id
        self.name = name
        self.heroDescription = heroDescription
        self.thumbnail = thumbnail
    }
    
    // MARK: - NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(heroDescription, forKey: "heroDescription")
        coder.encode(thumbnail, forKey: "thumbnail")
        
        
    }
    
    required init?(coder: NSCoder) {
        id = coder.decodeInteger(forKey: "id")
        name = coder.decodeObject(forKey: "name") as! String
        heroDescription = coder.decodeObject(forKey: "heroDescription") as! String
        thumbnail = coder.decodeObject(forKey: "thumbnail") as! String
        
    }
}
