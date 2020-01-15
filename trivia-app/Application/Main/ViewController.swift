//
//  ViewController.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 9/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectableCard: SelectableCard!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        selectableCard = SelectableCard(image: "BaseCard") {
            print("Selected")
        }
        
        setupCardConstraints()
    }
    
    func setupCardConstraints() {
        view.addSubview(selectableCard)
        selectableCard.heightAnchor.constraint(equalToConstant: 100).isActive = true
        selectableCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        selectableCard.constraintReference = selectableCard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200)
        selectableCard.constraintReference?.isActive = true
        
        selectableCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        selectableCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
    }

}

