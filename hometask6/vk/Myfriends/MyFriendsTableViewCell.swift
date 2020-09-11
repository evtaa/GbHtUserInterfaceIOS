//
//  MyFriendsTableViewCell.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class MyFriendsTableViewCell: UITableViewCell {

   // @IBOutlet weak var avatarImageView: UIImageView!
   // @IBOutlet weak var nameFull: UILabel!
   // @IBOutlet weak var city: UILabel!
    @IBOutlet weak var avatarView: AvatarCompositeView!
    @IBOutlet weak var userName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup (user: User) {
        avatarView.avatarPhoto.image = user.avatar
        userName.text = user.name
        avatarView.setup()
    }
}
