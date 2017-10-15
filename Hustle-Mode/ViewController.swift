//
//  ViewController.swift
//  Hustle-Mode
//
//  Created by Clint Liddiard on 10/4/17.
//  Copyright © 2017 Clint Liddiard. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var darkBlueBG: UIImageView!
    @IBOutlet var powerButton: UIButton!
    @IBOutlet var cloudHolder: UIView!
    @IBOutlet var rocket: UIImageView!
    @IBOutlet var hustleLbl: UILabel!
    @IBOutlet var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        } catch let error as NSError {
            print(error.description)
        }
        
    }
    
    @IBAction func powerButtonPressed(_ sender: UIButton) {
        
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 240, width: 375 , height: 178)
        }) { (finished) in
            self.hustleLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    

    

}

