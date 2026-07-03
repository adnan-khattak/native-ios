//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggDict = ["Soft": 5, "Medium": 8, "Hard": 12]
    var secondsPassed = 0
    let totalTime = eggDict[hardness]
    var timer = Timer()
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    @objc func updateTimer() {
        secondsPassed += 1
        print(secondsPassed)
    }
    
}
