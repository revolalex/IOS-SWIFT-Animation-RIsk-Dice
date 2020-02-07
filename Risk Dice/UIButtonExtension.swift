//
//  UIButtonExtension.swift
//  Risk Dice
//
//  Created by Alexandre RODRIGUEZ on 07/02/2020.
//  Copyright © 2020 Alexandre Rodriguez. All rights reserved.
//

import UIKit

extension UIButton {
    
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.6 // durée de l'animation
        pulse.fromValue = 0.95 // proportion de la taille initiale
        pulse.toValue = 1 // bouton oscille entre 0.95 et 1
        pulse.autoreverses = true // renverse l'anim = rétrécie puis s'aggrandie
        pulse.repeatCount = 2 // nombre de fois que le boutons oscille
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil) // ajouter l'animation
    }
    
    func flash(){
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 3
        
        layer.add(flash, forKey: nil)
    }
    
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
}
