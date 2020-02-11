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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //au démarrage change les dés
        defense()
        attack()
    }

    @IBAction func attackButtonPressed(_ sender: UIButton) {
        diceMooveRight() // animation des dés rotation, taille, déplaement
        animAttackDice() // anim les dés a l'aide du dictionnaire d'image
        sender.flash() // anim le bouton
        attack()
    }
    
    @IBAction func defenseButtonPressed(_ sender: UIButton) {
        diceMooveLeft()
        animateDefenseDice()
        sender.pulsate()
        defense()
    }

    fileprivate func animateDefenseDice() {
        animateDice(dice: defDice1, isAttack: false)
        animateDice(dice: defDice2, isAttack: false)
    }
    
    func attack(){
        attackDice1.image = UIImage.init(named: "dice\(randomDice())")
        attackDice2.image = UIImage.init(named: "dice\(randomDice())")
        attackDice3.image = UIImage.init(named: "dice\(randomDice())")
    }
    
    func defense (){
        defDice1.image = UIImage.init(named: "dice\(randomDice())d")
        defDice2.image = UIImage.init(named: "dice\(randomDice())d")
    }
    
    // animation des dés: itinération dans tableau d'image
    func animAttackDice(){
        animateDice(dice: attackDice1, isAttack: true)
        animateDice(dice: attackDice2, isAttack: true)
        animateDice(dice: attackDice3, isAttack: true)
    }
    
    // random entre 1 et 6
    func randomDice() -> Int {
        return Int.random(in: 1...6)
    }
    
    // fonction pour animer les dés a l'aide du dictionnaire (ture = dés attaque, false = dés défense)
    func animateDice(dice: UIImageView, isAttack: Bool){
        if (isAttack) {
            dice.animationImages = (diceAttackArray.shuffled() as! [UIImage])
        } else {
            dice.animationImages = (diceDefenseArray.shuffled() as! [UIImage])
        }
        dice.animationDuration = 1
        dice.animationRepeatCount = randomDice()
        dice.startAnimating()
    }
    
    // fonction pour deplacér les dés attack
    func mooveDiceToRight (){
        UIView.animate(withDuration: 0.5) {
            self.attackDice1.center.x += 50
            self.attackDice2.center.x += 50
            self.attackDice3.center.x += 50
        }
    }
    
    
    // fonction pour deplacér les dés attack
    func mooveDiceToLeft(){
        UIView.animate(withDuration: 0.5){
            self.attackDice1.center.x -= 50
            self.attackDice2.center.x -= 50
            self.attackDice3.center.x -= 50
        }
    }
    
    // animation des dés: déplacement, rotation et taille
    func diceMooveRight(){
        UIView.animate(withDuration: 6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.attackDice1.transform = CGAffineTransform(scaleX: 5, y: 5) //  augmente la taille des dés
            self.attackDice1.transform = CGAffineTransform(rotationAngle: CGFloat.pi) // rotation des dés
            self.attackDice1.transform = CGAffineTransform(translationX: 50, y: 0) // déplacement de 50 sur axe x
            
            self.attackDice2.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.attackDice2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.attackDice2.transform = CGAffineTransform(translationX: 50, y: 0)
            
            self.attackDice3.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.attackDice3.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.attackDice3.transform = CGAffineTransform(translationX: 50, y: 0)
            
        }) {
            finished in // quand l'animation est fini retour a la position d'origine
            self.attackDice1.transform = .identity
            self.attackDice2.transform = .identity
            self.attackDice3.transform = .identity
        }
    }
    
    func diceMooveLeft(){
        UIView.animate(withDuration: 6, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: [], animations: {
            self.defDice1.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.defDice1.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.defDice1.transform = CGAffineTransform(translationX: -50, y: 0) // deplace les dés de -50 sur l'axe x
            
            self.defDice2.transform = CGAffineTransform(scaleX: 5, y: 5)
            self.defDice2.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            self.defDice2.transform = CGAffineTransform(translationX: -50, y: 0)
            
        }) {
            finished in // quand l'animation est fini retour a la position d'origine
            self.defDice1.transform = .identity
            self.defDice2.transform = .identity
            
        }
    }
    

    
}
