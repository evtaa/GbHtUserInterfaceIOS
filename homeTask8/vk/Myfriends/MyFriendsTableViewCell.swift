//
//  MyFriendsTableViewCell.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class MyFriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarView: AvatarCompositeView!
    @IBOutlet weak var userName: UILabel!
    
    // MARK: Animation
    
    @IBAction func downButtonTouchDown(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        self.avatarView.avatarShadow.bounds.size.height -= 10
                        self.avatarView.avatarShadow.bounds.size.width -= 10
                        self.avatarView.avatarShadow.layer.cornerRadius -=  5
                        
                        self.avatarView.avatarPhoto.bounds.size.height -= 10
                        self.avatarView.avatarPhoto.bounds.size.width -= 10
                        self.avatarView.avatarPhoto.layer.cornerRadius -=  5
        })
        
        //        let animation = CASpringAnimation (keyPath: "transform.scale")
        //
        //        animation.fromValue = 1
        //        animation.toValue = 0.8
        //        animation.stiffness = 500
        //        animation.mass = 1
        //        animation.duration = 5
        //        animation.fillMode = CAMediaTimingFillMode.backwards
        //
        //        self.avatarView.layer.add (animation, forKey:  nil)
        
    }
    
    @IBAction func upButtonTouchUpInside(_ sender: Any) {
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 2,
                       options: [],
                       animations: {
                        self.avatarView.avatarShadow.bounds.size.height += 10
                        self.avatarView.avatarShadow.bounds.size.width += 10
                        self.avatarView.avatarShadow.layer.cornerRadius +=  5
                        
                        self.avatarView.avatarPhoto.bounds.size.height += 10
                        self.avatarView.avatarPhoto.bounds.size.width += 10
                        self.avatarView.avatarPhoto.layer.cornerRadius +=  5
        })
    }
    
    @IBAction func upButtonTouchUpOutside(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 2,
                       options: [],
                       animations: {
                        self.avatarView.avatarShadow.bounds.size.height += 10
                        self.avatarView.avatarShadow.bounds.size.width += 10
                        self.avatarView.avatarShadow.layer.cornerRadius +=  5
                        
                        self.avatarView.avatarPhoto.bounds.size.height += 10
                        self.avatarView.avatarPhoto.bounds.size.width += 10
                        self.avatarView.avatarPhoto.layer.cornerRadius +=  5
        })
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: Configure Cell
    
    func setup (user: User) {
        avatarView.avatarPhoto.image = user.avatar
        userName.text = user.name
        avatarView.setup()
    }
}
