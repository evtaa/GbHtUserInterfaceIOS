//
//  Community.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import Foundation
import  UIKit

class Community {
    internal init(name: String, avatar: UIImage?) {
        Community.communityCount += 1
        self.ID = Community.communityCount
        self.name = name
        self.avatar = avatar
    }
    static var communityCount: Int = 0
    var ID: Int
    var name : String
    var avatar : UIImage?
    
    static func == ( left: Community, right: Community) -> Bool {
        return left.name == right.name
    }
}

final class AllCommunitiesFactory {
    static func makeAllCommunities () -> [Community] {
        let allCommunity: [Community] =
            [Community (name: "Animals", avatar: UIImage(named: "avatarCommunityAnimals")),
             Community (name: "Robots", avatar: UIImage(named: "avatarCommunityRobots")),
             Community (name: "Programming", avatar: UIImage (named: "avatarCommunityProgramming"))]
        return allCommunity
    }
}

