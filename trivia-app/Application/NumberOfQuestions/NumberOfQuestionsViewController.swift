//
//  NumberOfQuestionsViewController.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 19/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class NumberOfQuestionsViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        slider.value = 5.0
    }
    

    @IBAction func sliderValueChanged(_ sender: Any) {
        let sliderValue = Float(slider.value)
        let sliderValueRounded = round(sliderValue)
        let intSliderValue = Int(sliderValueRounded)
        label.text = "\(intSliderValue)"
    }
    
}
