//
//  ViewController.swift
//  Risk Dice
//
//  Created by Alexandre RODRIGUEZ on 06/02/2020.
//  Copyright © 2020 Alexandre Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let diceAttackArray = [UIImage.init(named: "dice1"), UIImage.init(named: "dice2"), UIImage.init(named: "dice3"), UIImage.init(named: "dice4"), UIImage.init(named: "dice5"), UIImage.init(named: "dice6")]
    
    let diceDefenseArray = [UIImage.init(named: "dice1d"), UIImage.init(named: "dice2d"), UIImage.init(named: "dice3d"), UIImage.init(named: "dice4d"), UIImage.init(named: "dice5d"), UIImage.init(named: "dice6d")]
    
    @IBOutlet weak var attackDice1: UIImageView!
    
    
    @IBOutlet weak var attackDice2: UIImageView!
    
    @IBOutlet weak var attackDice3: UIImageView!
    
    @IBOutlet weak var defDice1: UIImageView!
    
    @IBOutlet weak var defDice2: UIImageView!
    
    func attack(){
        
        attackDice1.image = UIImage.init(named: "dice\(randomDice())")
        attackDice2.image = UIImage.init(named: "dice\(randomDice())")
        attackDice3.image = UIImage.init(named: "dice\(randomDice())")
        
        
    }
    
    func deffense (){
        defDice1.image = UIImage.init(named: "dice\(randomDice())d")
        defDice2.image = UIImage.init(named: "dice\(randomDice())d")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func attackButtonPress(_ sender: Any) {
        animAttackDice1()
        animAttackDice2()
        animAttackDice3()
        attack()
    }
    
    
    @IBAction func defButtonPress(_ sender: Any) {
        animDefDice1()
        animDefDice2()
        deffense()
    }
    
    
    
    
    
    func randomDice() -> Int {
        return Int.random(in: 1...6)
    }
    
    func animAttackDice1(){
        attackDice1.animationImages = (diceAttackArray.shuffled() as! [UIImage])
        attackDice1.animationDuration = 1
        attackDice1.animationRepeatCount = randomDice()
        attackDice1.startAnimating()
    }
    func animAttackDice2(){
        attackDice2.animationImages = (diceAttackArray.shuffled() as! [UIImage])
        attackDice2.animationDuration = 1
        attackDice2.animationRepeatCount = randomDice()
        attackDice2.startAnimating()
    }
    func animAttackDice3(){
        attackDice3.animationImages = (diceAttackArray.shuffled() as! [UIImage])
        attackDice3.animationDuration = 1
        attackDice3.animationRepeatCount = randomDice()
        attackDice3.startAnimating()
    }
    func animDefDice1(){
        defDice1.animationImages = (diceDefenseArray.shuffled() as! [UIImage])
        defDice1.animationDuration = 1
        defDice1.animationRepeatCount = randomDice()
        defDice1.startAnimating()
    }
    func animDefDice2(){
        defDice2.animationImages = (diceDefenseArray.shuffled() as! [UIImage])
        defDice2.animationDuration = 1
        defDice2.animationRepeatCount = randomDice()
        defDice2.startAnimating()
    }
    
}

