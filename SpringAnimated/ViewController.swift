//
//  ViewController.swift
//  Spring
//
//  Created by Алёша Виноградов on 17.05.2022.
//

import UIKit
import Spring

class ViewController: UIViewController{

    
    @IBOutlet weak var imageView: SpringImageView!
    
    var animationPreset = Spring.AnimationPreset.allCases
    var animationCurve = Spring.AnimationCurve.allCases

    @IBOutlet weak var presentPicker: UIPickerView!
    @IBOutlet weak var curvePicker: UIPickerView!
    
    @IBOutlet weak var forseLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var delayLabel: UILabel!
    
    
    @IBOutlet weak var forseSlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    @IBOutlet weak var delaySlider: UISlider!
    
    
 
    
    lazy var animation = Animation(animation: animationPreset[0].rawValue, curve: animationCurve[0].rawValue, forse: 1, duration: 1, delay: 1)
   

    override func viewDidLoad() {
        super.viewDidLoad()
        presentPicker.dataSource = self
        presentPicker.delegate = self

        curvePicker.dataSource = self
        curvePicker.delegate = self
        
        for slider in [forseSlider, durationSlider,delaySlider]{
            startsSettingsSlider(slider: slider!)
        }
        
        forseLabel!.text = "Forse: 1.00"
        durationLabel!.text = "Duration: 1.00"
        delayLabel!.text = "Delay: 1.00"
    
    }

    
  
    func startAnimation(){
        
        imageView.animation = animation.animation
        imageView.curve = animation.curve
        imageView.force = animation.forse
        imageView.duration = animation.duration
        imageView.delay = animation.delay
        
        imageView.animate()
        
    }
    
    
    
    
    private func startsSettingsSlider(slider : UISlider){
        slider.minimumValue = 0
        slider.maximumValue = 10
        slider.value = 1
    }
    
    
    
    @IBAction func infoButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "InfoView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let info = segue.destination as! InfoViewController
        info.animation = self.animation
    }
    
    @IBAction func forseSliderAction(_ sender: UISlider) {
        animation.forse = CGFloat(sender.value)
        forseLabel.text = "Forse: \(String(format:"%.2f", sender.value))"
        startAnimation()
    }
    
    
    @IBAction func durationSliderAction(_ sender: UISlider) {
        animation.duration = CGFloat(sender.value)
        durationLabel.text = "Duration: \(String(format: "%.2f", sender.value))"
            //  delayLabel.text = "Duration: \(String(format: "%.2f",sender.value))"
        startAnimation()
    }
    
    @IBAction func delaySliderAction(_ sender: UISlider) {
        animation.delay = CGFloat(sender.value)
        delayLabel.text = "Delay: \(String(format: "%.2f",sender.value))"
        startAnimation()
    }
    
    



}

extension ViewController : UIPickerViewDataSource{
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == presentPicker{
            
            animation.animation = animationPreset[row].rawValue
            startAnimation()
        }
        else if pickerView == curvePicker {
            animation.curve = animationCurve[row].rawValue
            startAnimation()
         
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == presentPicker{
            return animationPreset.count
           
        }
        else if pickerView == curvePicker {
            return animationCurve.count
        }
        return 0
    }
    
    
}


extension ViewController : UIPickerViewDelegate{
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        if pickerView == presentPicker{
            return animationPreset[row].rawValue
        }
        else if pickerView == curvePicker {
            return animationCurve[row].rawValue
        }
        return ""
        
        
        
        
    }
    
}
