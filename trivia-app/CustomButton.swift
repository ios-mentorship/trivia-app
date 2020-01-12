//
//  CustomButton.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 11/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        adjustsImageWhenHighlighted = false
        addActionToBottomButton()
        let raisedBackgroundImage = UIImage(named: "Primary Button") as UIImage?
        setBackgroundImage(raisedBackgroundImage, for: .normal)
        setTitle("Get started", for: .normal)
        setTitleColor(UIColor(named: "LightGray"), for: .normal)
        titleLabel?.font     = UIFont(name: "Comfortaa-Bold", size: 24)
    }
    
    func addActionToBottomButton() {
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        let pressedBackgroundImage = UIImage(named: "Primary Button Pressed") as UIImage?
        setBackgroundImage(pressedBackgroundImage, for: .normal)
    }
    
    @objc func buttonReleased() {
        let backgroundImage = UIImage(named: "Primary Button") as UIImage?
        setBackgroundImage(backgroundImage, for: .normal)
    }
}
