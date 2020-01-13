//
//  ViewController.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 9/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var accentButton: CustomButton!
    var primaryButton: CustomButton!
    var secondaryButton: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        accentButton = CustomButton(image: "AccentButton", titleColor: UIColor(named: "White")) {
            print("Accent Button Pressed")
        }
        primaryButton = CustomButton(image: "PrimaryButton", titleColor: UIColor(named: "White")) {
            print("Primary Button Pressed")
        }
        
        secondaryButton = CustomButton(image: "SecondaryButton", titleColor: UIColor(named: "Primary")) {
            print("Primary Button Pressed")
        }
        
        accentButton.setTitle("Accent Button", for: .normal)
        primaryButton.setTitle("Primary Button", for: .normal)
        secondaryButton.setTitle("Secondary Button", for: .normal)
        setupAccentButtonConstraints()
    }
    
    func setupAccentButtonConstraints() {
        view.addSubview(accentButton)
        accentButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        accentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        accentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        accentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        accentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        view.addSubview(primaryButton)
        primaryButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        primaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        primaryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
        
        view.addSubview(secondaryButton)
        secondaryButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        secondaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondaryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -600).isActive = true
    }

}

