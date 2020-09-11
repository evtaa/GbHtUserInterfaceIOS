//
//  MyNewsTableViewCell.swift
//  vk
//
//  Created by Alexandr Evtodiy on 02.09.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class MyNewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarShadow: UIView!
    @IBOutlet weak var avatarMyFriendNews: UIImageView!
    @IBOutlet weak var nameMyFriendNews: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var contentLabelNews: UILabel!
    @IBOutlet weak var imageContentView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarMyFriendNews.layer.cornerRadius = avatarMyFriendNews.frame.height/2
        let f = avatarMyFriendNews.frame
        avatarShadow.frame = CGRect (x: f.origin.x,
                                     y: f.origin.y,
                                     width: f.width,
                                     height: f.height)
        
        avatarShadow.layer.shadowColor = UIColor.black.cgColor
        avatarShadow.layer.shadowOpacity = 0.5
        avatarShadow.layer.shadowRadius = 10
        avatarShadow.layer.shadowOffset = CGSize(width: 3, height: 3)
        avatarShadow.layer.cornerRadius = avatarShadow.bounds.height/2
        
        // Initialization code
    }
    
    func setup (new: New) {
        avatarMyFriendNews.image = new.myFriend.avatar
        
        nameMyFriendNews.text = new.myFriend.name
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateOfNew = dateFormatter.string(from: new.date)
        date.text = dateOfNew
        
        contentLabelNews.text = new.contentText
        imageContentView.image = new.contentImage
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
