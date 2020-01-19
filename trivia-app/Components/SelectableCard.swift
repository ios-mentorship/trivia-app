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
    
    @IBInspectable private var image: String!
    //private var action: (() -> Void)!
    var constraintReference: NSLayoutConstraint?
    var audioPlayer = AVAudioPlayer()
    
    
    private var defaultImage: UIImage? {
        UIImage(named: image) as UIImage?
    }
    
    private var selectedImage: UIImage? {
        UIImage(named: "\(image ?? "")Selected") as UIImage?
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }
    
    convenience init(image: String, action: @escaping () -> Void) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.action = action
        let sound = Bundle.main.path(forResource: "tap", ofType: "mp3")
//        adjustsImageWhenHighlighted = false
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        
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
        //action()
        self.superview?.layoutIfNeeded()
        audioPlayer.play()
        
    }
}



class SelectableView: UIImageView {
    
    @IBInspectable private var imagePath: String!
    //private var action: (() -> Void)!
    var constraintReference: NSLayoutConstraint?
    var audioPlayer = AVAudioPlayer()
    
    
    private var defaultImage: UIImage? {
        UIImage(named: imagePath) as UIImage?
    }
    
    private var selectedImage: UIImage? {
        UIImage(named: "\(imagePath ?? "")Selected") as UIImage?
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCard()
    }
    
    convenience init(image: String, action: @escaping () -> Void) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.action = action
        let sound = Bundle.main.path(forResource: "tap", ofType: "mp3")
//        adjustsImageWhenHighlighted = false
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        } catch {
            print(error)
        }
        
    }
    
    
    func setupCard() {
        addActionToCard()
    }
    
    func addActionToCard() {
        isUserInteractionEnabled = true
        let recognizer = UILongPressGestureRecognizer(target: self, action: #selector(cardSelected(_:)))
        recognizer.minimumPressDuration = 0.0
        addGestureRecognizer(recognizer)
    }
    
    @objc func cardSelected(_ sender: UIGestureRecognizer) {
        switch sender.state {
        case .began:
            constraintReference?.constant -= 3
            image = selectedImage
            UIView.animate(withDuration: 0) {
                self.superview?.frame.origin.y += 3
            }
            break
        case .ended:
            constraintReference?.constant += 3
            image = defaultImage
            self.superview?.layoutIfNeeded()
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
            //action()
            self.superview?.layoutIfNeeded()
            audioPlayer.play()
            UIView.animate(withDuration: 0) {
                self.superview?.frame.origin.y -= 3
            }
            break
        default:
            break
        }
    }
}
