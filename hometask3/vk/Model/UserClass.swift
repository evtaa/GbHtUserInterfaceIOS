//
//  User.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import Foundation
class User {
    internal init(name: String, imageName: String, age: Int, city: String, photosNames: [String]) {
        self.name = name
        self.imageName = imageName
        self.age = age
        self.city = city
        self.photosNames = photosNames
    }
    
    var name : String
    var imageName : String
    var age : Int
    var city : String
    var photosNames :[String]

    
}
