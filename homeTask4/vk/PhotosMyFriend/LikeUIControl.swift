//
//  LikeUIControl.swift
//  vk
//
//  Created by Alexandr Evtodiy on 27.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class LikeUIControl: UIControl {

     var likeLabel = UILabel ()
     var likeButton = UIButton ()
     var stateLiked : Bool = false
    
    override func awakeFromNib() {
        
        self.backgroundColor = UIColor.clear
        let controlWidth = self.frame.width
        let controlHeight = self.frame.height
        let buttonSize: CGFloat = 30
        
        likeButton.frame = CGRect (x: controlWidth - buttonSize, y: controlHeight - buttonSize, width: buttonSize, height: buttonSize)
        likeButton.addTarget(self, action: #selector (likeButtonPressed), for: .touchUpInside)
        
        likeLabel.frame = CGRect (x: 0, y: controlHeight-buttonSize, width: controlWidth-buttonSize-5, height: buttonSize)
        likeLabel.font = UIFont.boldSystemFont(ofSize: likeLabel.font.pointSize)
        likeLabel.textAlignment = .right
        addSubview(likeLabel)
        addSubview(likeButton)
        setState (stateLiked)
    }
    
    func setState (_ isLiked: Bool) {
        likeButton.setTitle(isLiked ? "❤" : "💜", for: .normal)
        likeLabel.text = isLiked ? "1" : "0"
        likeLabel.textColor = isLiked ? UIColor.red : UIColor.purple
    }
    
    @objc func likeButtonPressed() {
        stateLiked.toggle()
        setState (stateLiked)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
