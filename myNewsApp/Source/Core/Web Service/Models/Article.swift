//
//  Article.swift
//  myNewsApp
//
//  Created by sanjog agarwal on 16/08/19.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import Foundation
import ObjectMapper

class Article : Mappable{
    dynamic var title : String = ""
    dynamic var imageURL : String = ""
    dynamic var URL : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        imageURL <- map["urlToImage"]
        URL <- map["url"]
    }
}
