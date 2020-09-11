//
//  CommentShareUIControl.swift
//  vk
//
//  Created by Alexandr Evtodiy on 03.09.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class CommentShareUIControl: UIControl {
    
    var commentButton = UIButton ()
    var shareButton = UIButton ()
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.clear
        //let controlWidth = self.frame.width
        let controlHeight = self.frame.height
        let buttonSize: CGFloat = 30
        
        commentButton.frame = CGRect (x: 0, y: controlHeight - buttonSize, width: buttonSize, height: buttonSize)
        shareButton.frame = CGRect (x: buttonSize, y: controlHeight - buttonSize, width: buttonSize, height: buttonSize)
        addSubview(commentButton)
        addSubview(shareButton)
        
        commentButton.setTitle("✍🏻", for: .normal)
        shareButton.setTitle("✉", for: .normal)
        
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
