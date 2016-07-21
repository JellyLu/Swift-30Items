//
//  ViewController.swift
//  Day 01 - SimpleStopWatch
//
//  Created by luyang on 7/14/16.
//  Copyright © 2016 lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!

    private var counter: Double = 0
    private var timer: NSTimer = NSTimer()
    private var isPlaying: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(counter)
    }

    @IBAction func play(sender: AnyObject) {
        if isPlaying { return }
        isPlaying = true
        playBtn.enabled = false
        pauseBtn.enabled = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

    }

    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
        playBtn.enabled = true
        pauseBtn.enabled = true
    }

    @IBAction func pause(sender: AnyObject) {
        isPlaying = false
        timer.invalidate()
        playBtn.enabled = true
        pauseBtn.enabled = false
    }

    func updateTimer() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.f", counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

