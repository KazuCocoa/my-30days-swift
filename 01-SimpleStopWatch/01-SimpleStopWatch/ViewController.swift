//
//  ViewController.swift
//  01-SimpleStopWatch
//
//  Created by kazucocoa on 05/04/2016.
//  Copyright © 2016 kazucocoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!

    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        timeLabel.text = String(Counter)
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        Timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        playButton.enabled = true
        pauseButton.enabled = true
    }

    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if IsPlaying { return }
        playButton.enabled = false
        pauseButton.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }

    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        playButton.enabled = true
        pauseButton.enabled = false
        Timer.invalidate()
        IsPlaying = false
    }

    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }


}

