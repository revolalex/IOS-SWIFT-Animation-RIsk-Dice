//
//  AnimView.swift
//  Risk Dice
//
//  Created by Alexandre RODRIGUEZ on 06/02/2020.
//  Copyright © 2020 Alexandre Rodriguez. All rights reserved.
//

import UIKit

class AnimView: UIView {
    
    enum Direction: Int {
        case FromLeft = 0
        case FromRight = 1
    }

    @IBInspectable var direction: Int = 0
    
    override func layoutSubviews() {
        initAnim()
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .curveEaseIn, animations: {
            if let s = self.superview {
                if self.direction == Direction.FromLeft.rawValue {
                    self.center.x += s.bounds.width
                } else {
                    self.center.x -= s.bounds.width
                }
            }
            
        }, completion: nil)
    }
    
    func initAnim(){
        if let s = self.superview {
            if direction == Direction.FromLeft.rawValue{
                self.center.x -= s.bounds.width
            } else {
                self.center.x += s.bounds.width
            }
        }
    }
}
