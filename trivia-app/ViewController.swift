//
//  ViewController.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 9/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var bottomCustomButton = CustomButton()
    var accentButton = AccentButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupBottomButtonConstraints()
        setupTopButtonConstraints()
    }
    
    func setupBottomButtonConstraints() {
        view.addSubview(bottomCustomButton)
        bottomCustomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomCustomButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        bottomCustomButton.widthAnchor.constraint(equalToConstant: 315).isActive = true
        bottomCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomCustomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }
    
    func setupTopButtonConstraints() {
        view.addSubview(accentButton)
        accentButton.translatesAutoresizingMaskIntoConstraints = false
        accentButton.heightAnchor.constraint(equalToConstant: 53).isActive = true
        accentButton.widthAnchor.constraint(equalToConstant: 315).isActive = true
        accentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        accentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400).isActive = true
        
    }
}

