//
//  AllCommunitiesTableViewCell.swift
//  vk
//
//  Created by Alexandr Evtodiy on 07.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class AllCommunitiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatarView: AvatarCompositeView!
    
    // MARK: Animation
    
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
        
        //        UIView.animate(withDuration: 0.3) {
        //                   self.avatarView.avatarShadow.bounds.size.height += 10
        //                   self.avatarView.avatarShadow.bounds.size.width += 10
        //                   self.avatarView.avatarShadow.layer.cornerRadius +=  5
        //
        //                   self.avatarView.avatarPhoto.bounds.size.height += 10
        //                   self.avatarView.avatarPhoto.bounds.size.width += 10
        //                   self.avatarView.avatarPhoto.layer.cornerRadius +=  5
        //               }
    }
    
    @IBAction func upButtonTouchUpOutside(_ sender: Any) {
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
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
    func setup (community: Community) {
        
        name.text = community.name
        avatarView.avatarPhoto.image = community.avatar
        avatarView.setup ()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
