//
//  AvatarCompositeView.swift
//  vk
//
//  Created by Alexandr Evtodiy on 26.08.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class AvatarCompositeView: UIView {
    
    @IBOutlet weak var avatarPhoto: UIImageView!
    @IBOutlet weak var avatarShadow: UIView!
    
    @IBInspectable var shadowWidth: CGFloat = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var opacity: Float = 0.5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor = UIColor.black {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize (width: 10, height: 10) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    func setup() {
        avatarPhoto.layer.cornerRadius = avatarPhoto.bounds.height/2
        //avatarPhoto.layer.cornerRadius = 40
        avatarPhoto.setNeedsDisplay()
        
        let f = avatarPhoto.frame
        avatarShadow.frame = CGRect (x: f.origin.x,
                                     y: f.origin.y,
                                     width: f.width,
                                     height: f.height)
        
        avatarShadow.layer.shadowColor = color.cgColor
        avatarShadow.layer.shadowOpacity = opacity
        avatarShadow.layer.shadowRadius = shadowWidth
        avatarShadow.layer.shadowOffset = shadowOffset
        avatarShadow.layer.cornerRadius = avatarShadow.bounds.height/2
        //avatarShadow.layer.cornerRadius = 40
        avatarShadow.setNeedsDisplay()
    }
}
