//
//  Community.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import Foundation
class Community {
    internal init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    var name : String
    var imageName : String
    
    
}
func ==( lhs: Community, rhs: Community ) -> Bool {
    return lhs.name == rhs.name
}
