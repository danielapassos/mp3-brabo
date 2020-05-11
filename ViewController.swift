//
//  ViewController.swift
//  mp3 Brabo
//
//  Created by Daniela Passos on 5/10/20.
//  Copyright © 2020 Daniela Passos. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let audioPath = Bundle.main.path(forResource: "ES_Boss Agogo - Gabriel Lucas", ofType: "mp3")
    var player = AVAudioPlayer()
    var timer = Timer()
    
    @objc func updateScrubber () {
        scrubber.value = Float (player.currentTime)
    }

    @IBAction func tocar(_ sender: Any) {
        player.play()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateScrubber), userInfo: nil, repeats: true)
    }
    
    @IBAction func stop(_ sender: Any) {
        scrubber.value = 0
        player.stop()
        timer.invalidate()
        
    do {
            
            try player = AVAudioPlayer (contentsOf: URL(fileURLWithPath: audioPath!))
            
            
        } catch {
                
            }
         
       
    }
    
    @IBAction func scrubberMoved(_ sender: Any) {
        player.currentTime = TimeInterval(scrubber.value)
    }
    
    @IBOutlet var scrubber: UISlider!
    
    
    @IBAction func pause(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    
    @IBAction func volume(_ sender: Any) {
        player.volume = volume.value
    }
    
    @IBOutlet var volume: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
           
        
        do {
            
            try player = AVAudioPlayer (contentsOf: URL(fileURLWithPath: audioPath!))
            scrubber.maximumValue = Float(player.duration)
            
            
        } catch {
                
            }
            
        }
        
    }


