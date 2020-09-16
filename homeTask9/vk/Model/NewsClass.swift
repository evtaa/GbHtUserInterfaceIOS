//
//  NewsClass.swift
//  vk
//
//  Created by Alexandr Evtodiy on 02.09.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import Foundation
import UIKit

class New {
    internal init(myFriend: User, date: Date, contentText: String, contentImage: UIImage) {
        New.newCount += 1
        self.ID = New.newCount
        self.myFriend = myFriend
        self.date = date
        self.contentText = contentText
        self.contentImage = contentImage
    }
    
    static var newCount: Int = 0
    var ID: Int
    var myFriend: User
    var date : Date
    var contentText: String
    var contentImage: UIImage
    
}

final class MyNewsFactory {
    
    static var myFriends : [User] = MyFriendsFactory.makeMyFriends()
    
    static func makeMyNews () -> [New] {
        var myNews: [New] = []
        for myFriend in myFriends {
            let new = New(myFriend: myFriend, date: Date (), contentText: "Атланти́да (др.-греч. Ἀτλαντὶς) — мифический остров-государство. Наиболее подробное описание Атлантиды известно по диалогам Платона, который ссылался на Солона; также известны упоминания и комментарии Геродота, Диодора Сицилийского, Посидония, Страбона, Прокла.", contentImage: UIImage (named: "Atlantida")!)
            myNews.append(new)
        }
        return myNews
    }
}

