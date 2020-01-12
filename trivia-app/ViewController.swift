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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupBottomButtonConstraints()
    }
    
    func setupBottomButtonConstraints() {
        view.addSubview(bottomCustomButton)
        bottomCustomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomCustomButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomCustomButton.widthAnchor.constraint(equalToConstant: 280).isActive = true
        bottomCustomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomCustomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }
}

