//
//  SelectableCard.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 14/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit
import AVFoundation

class SelectableCard: UIButton {
    
    private var image: String!
    private var action: (() -> Void)!
    var constraintReference: NSLayoutConstraint?
    var audioPlayer = AVAudioPlayer()
    
    
    private var defaultImage: UIImage? {
        UIImage(named: image) as UIImage?
    }
    
    private var selectedImage: UIImage? {
        UIImage(named: "\(image ?? "")Selected") as UIImage?
    }
    
    convenience init(image: String, action: @escaping () -> Void) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        self.action = action
        let sound = Bundle.main.path(forResource: "tap", ofType: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        
        setupCard()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCard()
    }
    
    
    func setupCard() {
        adjustsImageWhenHighlighted = false
        addActionToCard()
        setBackgroundImage(defaultImage, for: .normal)
        setBackgroundImage(selectedImage, for: .selected)
    }
    
    func addActionToCard() {
        self.addTarget(self, action: #selector(cardSelected), for: .touchUpInside)
    }
    
    @objc func cardSelected() {
        if self.isSelected == true {
            self.isSelected = false
            constraintReference?.constant -= 3
            self.superview?.layoutIfNeeded()
        } else {
            self.isSelected = true
            constraintReference?.constant += 3
            self.superview?.layoutIfNeeded()
        }
        let generator = UIImpactFeedbackGenerator(style: .soft)
        generator.impactOccurred()
        action()
        self.superview?.layoutIfNeeded()
        audioPlayer.play()
        
    }
}
