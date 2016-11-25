//
//  ViewController.swift
//  Tappy
//
//  Created by Terrell Robinson on 11/1/16.
//  Copyright © 2016 FlyGoody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapMe: UIButton!
    @IBOutlet weak var startGame: UIButton!
    
    var timer = Timer()
    
    
    var timeInt = 0
    var tapInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeInt = 10
        tapInt = 0
        
        timerLabel.text = String(timeInt)
        scoreLabel.text = String(tapInt)
        
        tapMe.isHidden = true
        tapMe.isEnabled = false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func startCounter() {
        
        timeInt -= 1
        timerLabel.text = String(timeInt)
        
        if timeInt == 0 { // Once the time reaches 0 stop the clock and disable/hide the tap me button
            
            timer.invalidate()
            
            tapMe.isEnabled = false
            tapMe.isHidden = true
            
            startGame.isEnabled = true
            startGame.alpha = 1
            
            startGame.setTitle("RESTART", for: .normal) // Changes text to "RESTART" once clock reaches 0
        }
        
        
    }

    @IBAction func tapMeButton(_ sender: AnyObject) {
        
        tapInt += 1
        scoreLabel.text = String(tapInt)
        
    }
    
    
    @IBAction func startGameButton(_ sender: AnyObject) {
        
        if timeInt == 10 {
            
            tapInt = 0
            scoreLabel.text = String(tapInt)
            
            tapMe.isHidden = false
            tapMe.isEnabled = true
            
            startGame.isEnabled = false
            startGame.alpha = 0.5
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCounter), userInfo: nil, repeats: true)
            
        }
        
        if timeInt == 0 {
            timeInt = 10
            tapInt = 0
            
            timerLabel.text = String(timeInt)
            scoreLabel.text = String(tapInt)
            
            startGame.setTitle("START GAME", for: .normal)
        }
        
        
    }
    

}

