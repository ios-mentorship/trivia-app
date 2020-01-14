//
//  AccentButton.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 12/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class AccentButton: CustomButton {
    override func setupButton() {
        let raisedBackgroundImage = UIImage(named: "Accent Button") as UIImage?
        setBackgroundImage(raisedBackgroundImage, for: .normal)
        setTitle("Get started", for: .normal)
        setTitleColor(UIColor(named: "LightGray"), for: .normal)
        titleLabel?.font     = UIFont(name: "Comfortaa-Bold", size: 24)
    }
}
