//
//  CustomButton.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 11/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit
import AVFoundation

class CustomButton: UIButton {
    
    private var image: String!
    private var titleColor: UIColor!
    private var action: (() -> Void)!
    var constraintReference: NSLayoutConstraint?
    var audioPlayer = AVAudioPlayer()
    
    
    private var defaultImage: UIImage? {
        UIImage(named: image) as UIImage?
    }
    
    private var selectedImage: UIImage? {
        UIImage(named: "\(image ?? "")Selected") as UIImage?
    }
    
    convenience init(image: String, titleColor: UIColor? = .white, action: @escaping () -> Void) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        self.titleColor = titleColor
        self.action = action
        let sound = Bundle.main.path(forResource: "tap", ofType: "mp3")
        
        do {
           audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        
        setupButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        adjustsImageWhenHighlighted = false
        addActionToBottomButton()
        setBackgroundImage(defaultImage, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = UIFont(name: "Comfortaa-Bold", size: 24)
        contentEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    func addActionToBottomButton() {
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: .touchUpInside)
    }
    
    @objc func buttonPressed() {
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        setBackgroundImage(selectedImage, for: .normal)
        
        constraintReference?.constant += 3
        self.superview?.layoutIfNeeded()
        audioPlayer.play()

    }
    
    @objc func buttonReleased() {
        setBackgroundImage(defaultImage, for: .normal)
        action()
        constraintReference?.constant -= 3
        self.superview?.layoutIfNeeded()
    }
}
