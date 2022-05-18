//
//  InfoViewController.swift
//  SpringAnimated
//
//  Created by Алёша Виноградов on 18.05.2022.
//

import UIKit
import Spring

class InfoViewController: UIViewController {

    var animation : Animation!
    
    @IBOutlet weak var imageView: SpringImageView!
    
    
    
    @IBOutlet weak var startAnimationButton: UIButton!
    
    @IBOutlet weak var presetLabel: UILabel!
    @IBOutlet weak var curveLabel: UILabel!
    @IBOutlet weak var forseLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startsSettings()
        startAnimationButton.layer.cornerRadius = 10
        
    }

    
    
    @IBAction func startAnimationButtonAction(_ sender: UIButton) {
        startAnimation()
    }
    
    
    func startAnimation(){
        
        imageView.animation = animation.animation
        imageView.curve = animation.curve
        imageView.force = animation.forse
        imageView.duration = animation.duration
        imageView.delay = animation.delay
        
        imageView.animate()
        
    }
    
    
   // \(String(format:"%.2f", sender.value))
    
    private func startsSettings(){
        presetLabel.text = "Preset: \(String(animation.animation))"
        curveLabel.text = "Curve: \(String(animation.curve))"
        forseLabel.text = "Forse: \(String(format:"%.4f",animation.forse))"
        durationLabel.text = "Duration: \(String(format:"%.4f",animation.duration))"
        delayLabel.text = "Delay: \(String(format:"%.4f", animation.delay))"
        
    }


}
