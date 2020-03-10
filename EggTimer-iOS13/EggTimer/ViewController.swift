//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3.0, "Medium": 4.0, "Hard": 7.0]
    var totalTime = 0.0
    var timePassed = 0.0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var notificationLabel: UILabel!

    @IBOutlet weak var hardProgressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        // stops timer on button press
        timer.invalidate()
        hardProgressBar.progress = 0.0
        timePassed = 0.0
        notificationLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        // selector choses method to use on Timer
        // userInfo passes on the variable you want to use for method called
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    @objc func countDown() {
        if timePassed < totalTime {
            timePassed += 1.0
            hardProgressBar.progress = Float(timePassed) / Float(totalTime)
        } else {
            timer.invalidate()
            notificationLabel.text = "Done!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
    }
    
    

}

//        switch hardness {
//        case "Soft":
//            print(5)
//        case "Medium":
//            print(7)
//        case "Hard":
//            print(12)
//        default:
//            print("Error")
//        }
        
//        if hardness == "Soft" {
//            print(softTime)
//        }
//        else if hardness == "Medium" {
//            print(mediumTime)
//        }
//        else {
//            print(hardTime)
//        }
