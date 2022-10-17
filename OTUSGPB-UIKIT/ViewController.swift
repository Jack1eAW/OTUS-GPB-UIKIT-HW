//
//  ViewController.swift
//  OTUSGPB-UIKIT
//
//  Created by Aleksandr Chebotarev on 10/11/22.
//

import UIKit

class ViewController: UIViewController {

    var number = 0
    var timerCounting: Bool = false
    var timer: Timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        timerCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
            timer.invalidate()
        }
    
    @objc func timerCounter() -> Void
        {
            number = number + 1
            let time = secondsToHoursMinutesSeconds(seconds: number)
            let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
            timerLabel.text = timeString
        }
        
        func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
        {
            return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
        }
        
        func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String
        {
            var timeString = ""
            timeString += String(format: "%02d", hours)
            timeString += " : "
            timeString += String(format: "%02d", minutes)
            timeString += " : "
            timeString += String(format: "%02d", seconds)
            return timeString
        }
}

