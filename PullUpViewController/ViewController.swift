//
//  ViewController.swift
//  PullUpViewController
//
//  Created by Ethan on 2018/7/27.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var drawContainerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var drawContainerView: UIView!
    var panGesture: UIPanGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawContainerView.frame = CGRect(x: 0, y: self.view.bounds.size.height / 2, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        self.drawContainerView.roundCorner([.topRight, .topLeft], radius: 10)
        self.panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction))
        self.drawContainerView.addGestureRecognizer(panGesture)
    }
    
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.drawContainerView)
        let y = self.drawContainerView.frame.origin.y
        self.drawContainerView.frame = CGRect(x: 0, y: y+translation.y, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        sender.setTranslation(CGPoint.zero, in: self.drawContainerView)
    }



}

