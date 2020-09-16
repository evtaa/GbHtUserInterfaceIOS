//
//  User.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import Foundation
import UIKit
class User {
    internal init(name: String, avatar: UIImage?, city: String?, photos: [UIImage?]) {
        User.userCount += 1
        self.ID = User.userCount
        self.name = name
        self.avatar = avatar
        self.city = city
        self.photos = photos
    }
    
    static var userCount: Int = 0
    var ID: Int
    var name: String
    var avatar: UIImage?
    var city: String?
    var photos: [UIImage?]
}

final class MyFriendsFactory {
    
    static func makeMyFriends () -> [User] {
        
        let myFriends: [User] = [
            
            User(name: "Helena Bonham Carter", avatar: UIImage(named: "avatarHelena Bonham Carter"), city: "New York", photos:
                [UIImage(named: "photo1Helena Bonham Carter"),
                 UIImage(named: "photo2Helena Bonham Carter"),
                 UIImage(named: "photo3Helena Bonham Carter"),
                 UIImage(named: "photo4Helena Bonham Carter"),
                 UIImage(named: "photo5Helena Bonham Carter"),
                 UIImage(named: "photo6Helena Bonham Carter"),
                 UIImage(named: "photo7Helena Bonham Carter")]),
            
            User(name: "Keanu Reeves", avatar: UIImage (named: "avatarKeanu Reeves"), city: "Las Vegas", photos:
                [UIImage(named: "photo1Keanu Reeves"),
                 UIImage(named: "photo2Keanu Reeves"),
                 UIImage(named: "photo3Keanu Reeves"),
                 UIImage(named: "photo4Keanu Reeves"),
                 UIImage(named: "photo5Keanu Reeves"),
                 UIImage(named: "photo6Keanu Reeves")]),
            
            User(name: "Laurence Fishburne", avatar: UIImage(named: "avatarLaurence Fishburne"), city: "Mexico", photos:
                [UIImage(named: "photo1Laurence Fishburne"),
                 UIImage(named: "photo2Laurence Fishburne"),
                 UIImage(named: "photo3Laurence Fishburne")]),
            
            User(name: "Edward Norton", avatar: UIImage (named: "avatarEdward Norton"), city: "Los Angeles", photos:
            [UIImage(named: "photo1Edward Norton"),
             UIImage(named: "photo2Edward Norton"),
             UIImage(named: "photo3Edward Norton"),
             UIImage(named: "photo4Edward Norton"),
             UIImage(named: "photo5Edward Norton")]),
            
            User(name: "Carrie-Anne Moss", avatar: UIImage (named: "avatarCarrie-Anne Moss"), city: "Chicago", photos:
            [UIImage(named: "photo1Carrie-Anne Moss"),
             UIImage(named: "photo2Carrie-Anne Moss"),
             UIImage(named: "photo3Carrie-Anne Moss"),
             UIImage(named: "photo4Carrie-Anne Moss"),
             UIImage(named: "photo5Carrie-Anne Moss"),
             UIImage(named: "photo6Carrie-Anne Moss"),
             UIImage(named: "photo7Carrie-Anne Moss"),
             UIImage(named: "photo8Carrie-Anne Moss"),
             UIImage(named: "photo9Carrie-Anne Moss")]),
            
            User(name: "Brad Pitt", avatar: UIImage (named: "avatarBrad Pitt"), city: "Houston", photos:
            [UIImage(named: "photo1Brad Pitt"),
             UIImage(named: "photo2Brad Pitt")]),
            
            User(name: "Belinda McClory", avatar: UIImage (named: "avatarBelinda McClory"), city: "Detroit", photos:
            [UIImage(named: "photo1Belinda McClory"),
             UIImage(named: "photo2Belinda McClory"),
             UIImage(named: "photo3Belinda McClory")])
        ]
        
        return myFriends
    }
}
