//
//  PhotosMyFriendsSwipeViewController.swift
//  vk
//
//  Created by Alexandr Evtodiy on 08.09.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class PhotosMyFriendsSwipeViewController: UIViewController {
    
    var friendSelected : User?
    var indexImage : Int?
    
    @IBOutlet weak var imageView: UIImageView!
    
    var interactiveAnimator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = friendSelected?.name {
            self.navigationItem.title = name
        }
        
        self.imageView.image = friendSelected?.photos[indexImage!]
        self.imageView.isUserInteractionEnabled = true
        
        //addSwipe ()
        
        // Инициализация и добавление параметров жестов
        let directions: [UISwipeGestureRecognizer.Direction] = [.down, .up, .left, .right]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer (target: self, action: #selector(handleSwipe))
            gesture.direction = direction
            self.imageView.addGestureRecognizer(gesture)
        }
    }
    
    @objc func handleSwipe (gesture: UISwipeGestureRecognizer) {
        
        let direction = gesture.direction
        
        switch direction {
            
        case .left:
            
            if indexImage == (friendSelected?.photos.count)! - 1 {
                indexImage = 0
            } else {
                indexImage! += 1
            }
            imageView.image = friendSelected?.photos[indexImage!]
            
            UIView.animate(withDuration: 1) {
                let animation = CATransition ()
                animation.duration = 1
                animation.startProgress = 0.5
                animation.endProgress = 1
                animation.type = CATransitionType (rawValue: "pageCurl")
                animation.subtype = CATransitionSubtype.fromRight
                animation.isRemovedOnCompletion = false
                animation.fillMode = CAMediaTimingFillMode (rawValue: "extended")
                animation.isRemovedOnCompletion = false
                animation.autoreverses = false
                
                self.imageView.layer.add (animation, forKey: "pageFlipAnimation")
                // self.containerView.addSubview (self.imageView)
                self.imageView.image = self.friendSelected?.photos[self.indexImage!]
            }
            
        case .right:
            
            if indexImage == 0 {
                indexImage = (friendSelected?.photos.count)! - 1
            } else {
                indexImage! -= 1
            }
            imageView.image = friendSelected?.photos[indexImage!]
            
            UIView.animate(withDuration: 1) {
                let animation = CATransition ()
                animation.duration = 1
                animation.startProgress = 0.5
                animation.endProgress = 1
                animation.type = CATransitionType (rawValue: "pageCurl")
                animation.subtype = CATransitionSubtype.fromLeft
                animation.isRemovedOnCompletion = false
                animation.fillMode = CAMediaTimingFillMode (rawValue: "extended")
                animation.isRemovedOnCompletion = false
                animation.autoreverses = false
                
                self.imageView.layer.add (animation, forKey: "pageFlipAnimation")
                // self.containerView.addSubview (self.imageView)
                self.imageView.image = self.friendSelected?.photos[self.indexImage!]
            }
        default:
            break
        }
    }
}
