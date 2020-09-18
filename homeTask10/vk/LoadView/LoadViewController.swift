//
//  LoadViewController.swift
//  vk
//
//  Created by Alexandr Evtodiy on 06.09.2020.
//  Copyright © 2020 Alexandr Evtodiy. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController {

    @IBOutlet weak var firstPoint: UILabel!
    @IBOutlet weak var secondPoint: UILabel!
    @IBOutlet weak var thirdPoint: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToTapBarController ()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animatePointLoad ()
    }

    func animatePointLoad () {
        
        firstPoint.transform = CGAffineTransform (translationX: 1, y: 10)
        secondPoint.transform = CGAffineTransform (translationX: 1, y: 10)
        thirdPoint.transform = CGAffineTransform (translationX: 1, y: 10)
        
        UIView.animate(withDuration: 0.5,
                       delay:0,
                       options: [.autoreverse, .repeat],
                       animations: {
                        self.firstPoint.transform = .identity
                        self.firstPoint.alpha = 0.2
        },
                       completion: nil)
        
        UIView.animate(withDuration: 0.5,
                       delay:0.5,
                              options: [.autoreverse, .repeat],
                              animations: {
                               self.secondPoint.transform = .identity
                               self.secondPoint.alpha = 0.2
               },
                              completion: nil)
        
        UIView.animate(withDuration: 0.5,
                              delay:1,
                              options: [.autoreverse, .repeat],
                              animations: {
                               self.thirdPoint.transform = .identity
                               self.thirdPoint.alpha = 0.2
               },
                              completion: nil)
    }
    
    func goToTapBarController () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let nextViewController = self.storyboard!.instantiateViewController(identifier: "TabBar") as UIViewController
            nextViewController.modalPresentationStyle = .fullScreen
            self.present (nextViewController,animated: true, completion: nil)
            
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
