//
//  ViewController.swift
//  XylophoneApp
//
//  Created by pu on 06/07/20.
//  Copyright © 2020 Rock India. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    @IBOutlet weak var buttonF: UIButton!
    @IBOutlet weak var buttonG: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    
    var player: AVAudioPlayer!
    var touchPoint = CGPoint()
    var myGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGesture = UIPanGestureRecognizer(target: self, action: #selector(panDetected(sender:)))
        myGesture.maximumNumberOfTouches = 1
        view.addGestureRecognizer(myGesture)
    }
    
    @objc func panDetected(sender : UIPanGestureRecognizer) {
        touchPoint = sender.location(in: self.view)
        
        
        if buttonC.frame.contains(touchPoint) {
            //  playSound(soundName: "C")
            print("C")
            
        }
        else if buttonC.frame.contains(touchPoint) {
            //  playSound(soundName: "C")
            print("D")
            
        }
        else if buttonC.frame.contains(touchPoint) {
            //  playSound(soundName: "C")
            print("E")
            
        }
        else if buttonC.frame.contains(touchPoint) {
            //  playSound(soundName: "C")
            print("F")
            
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delayWithSeconds(5){
            self.xyloLoop()
        }
        
     }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        
        animation(sender: sender)
        playSound(soundName: "\(sender.currentTitle ?? "")")
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: "\(soundName)", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
 
    func xyloLoop() {
        for index in 1...7 {
            print(index)
            switch index {
            case 1:
                delayWithSeconds(1){self.animation(sender: self.buttonC)}
                playSound(soundName: "C")
                
            case 2 :
                delayWithSeconds(2){self.animation(sender: self.buttonD)}
                playSound(soundName: "D")
                
            case 3 :
                delayWithSeconds(3){self.animation(sender: self.buttonE)}
                playSound(soundName: "E")
                
            case 4 :
                delayWithSeconds(4){self.animation(sender: self.buttonF)}
                playSound(soundName: "F")
                
            case 5 :
                delayWithSeconds(5){self.animation(sender: self.buttonG)}
                playSound(soundName: "G")
                
            case 6 :
                delayWithSeconds(6){self.animation(sender: self.buttonA)}
                playSound(soundName: "A")
                
            case 7 :
                delayWithSeconds(7){self.animation(sender: self.buttonB)}
                playSound(soundName: "B")
                
            default:
                print("Over")
            }
            
            
        }
    }
    func animation(sender: UIButton)  {
        
        sender.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
                        sender.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
        
    }
    
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
}
