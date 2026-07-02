//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let diceImages = [
        UIImage(imageLiteralResourceName: "DiceOne"),
        UIImage(imageLiteralResourceName: "DiceTwo"),
        UIImage(imageLiteralResourceName: "DiceThree"),
        UIImage(imageLiteralResourceName: "DiceFour"),
        UIImage(imageLiteralResourceName: "DiceFive"),
        UIImage(imageLiteralResourceName: "DiceSix")
    ]
    
    
    @IBOutlet weak var diceViewOne: UIImageView!
    @IBOutlet weak var diceViewTwo: UIImageView!
    @IBOutlet weak var diceViewThree: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rollDice()
    }
    func rollDice(){
    
        diceViewOne.image = diceImages.randomElement()
        diceViewTwo.image = diceImages.randomElement()
        diceViewThree.image = diceImages.randomElement()
}
    @IBAction func diceRoll(_ sender: UIButton) {
        rollDice()
    }
}


