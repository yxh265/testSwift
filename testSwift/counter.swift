//
//  Counter.swift
//  testSwift
//
//  Created by tamik on 16/3/3.
//  Copyright © 2016年 yuxuhong. All rights reserved.
//
import UIKit
import Foundation

class counter: UIViewController {
    var playBtn: UIButton!
    var pauseBtn: UIButton!
    var timeLabel:UILabel!
    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle{
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        timeLabel = UILabel(frame: CGRectMake(100,100,320,100))
        timeLabel.textColor = UIColor.redColor()
        self.view.addSubview(timeLabel)
        
        playBtn = UIButton(frame: CGRectMake(100,200,100,40))
        playBtn.setTitle("开始", forState: UIControlState.Normal)
        playBtn.backgroundColor = UIColor.blackColor()
        playBtn.addTarget(self, action: "playButtonDidTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(playBtn)
        
        pauseBtn = UIButton(frame: CGRectMake(100,300,100,40))
        pauseBtn.setTitle("暂停", forState: UIControlState.Normal)
        pauseBtn.backgroundColor = UIColor.blackColor()
        pauseBtn.addTarget(self, action: "pauseButtonDidTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pauseBtn)
        
        timeLabel.text = String(Counter)
        
        super.viewDidLoad()
    }
    
    func playButtonDidTouch(sender: AnyObject){
        if(IsPlaying){
            return
        }
        playBtn.hidden = true
        pauseBtn.hidden = false
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    
    func pauseButtonDidTouch(sender:AnyObject){
        playBtn.hidden = false
        pauseBtn.hidden = true
        Timer.invalidate()
        IsPlaying = false
    }
    
    func UpdateTimer(){
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
}
