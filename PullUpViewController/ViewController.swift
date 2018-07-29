//
//  ViewController.swift
//  PullUpViewController
//
//  Created by Ethan on 2018/7/27.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawContainerView: UIView!
    var panGesture: UIPanGestureRecognizer!
    var collapsed: CGFloat = 0
    var open: CGFloat = 0
    var partialReveal: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDrawContainerViewHeight()
        self.drawContainerView.frame = CGRect(x: 0, y: self.partialReveal, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        self.drawContainerView.roundCorner([.topRight, .topLeft], radius: 10)
        self.panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureAction))
        self.drawContainerView.addGestureRecognizer(panGesture)
    }
    
    func  setDrawContainerViewHeight() {
        self.collapsed = 3 * self.view.bounds.size.height / 4
        self.partialReveal = self.view.bounds.size.height / 2
    }
    
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.drawContainerView)
        let y = self.drawContainerView.frame.origin.y
        let velocity = sender.velocity(in: self.drawContainerView)
        let isDown = velocity.y > 0
        
        switch sender.state {
        case .began:
            print("began")
        case .changed:
            self.drawContainerView.frame = CGRect(x: 0, y: y+translation.y, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
            sender.setTranslation(CGPoint.zero, in: self.drawContainerView)
        case .ended:
            if self.drawContainerView.frame.origin.y > self.partialReveal && self.drawContainerView.frame.origin.y < self.collapsed {
                self.drawContainerView.frame.origin.y = self.partialReveal
            } else {
                if isDown {
                    self.drawContainerView.frame.origin.y = self.collapsed
                } else {
                    self.drawContainerView.frame.origin.y = self.open
                }
            }
        default:
            break
        }
    }



}

