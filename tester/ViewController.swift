//
//  ViewController.swift
//  tester
//
//  Created by Poorna Jayasinghe on 6/11/20.
//  Copyright © 2020 Poorna Jay. All rights reserved.
//

import UIKit
import DSSlider

class ViewController: UIViewController, DSSliderDelegate {
    
    func sliderDidFinishSliding(_ slider: DSSlider, at position: DSSliderPosition) {
        print("Slider finished")
    }
    

    @IBOutlet weak var baseView: UIView!
    
    var slider: DSSlider! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider = DSSlider(frame: baseView.frame, delegate: self)
        self.baseView.backgroundColor = UIColor.clear

        slider.isDoubleSideEnabled = false
        slider.isImageViewRotating = true
        slider.isTextChangeAnimating = true
        slider.isDebugPrintEnabled = false
        slider.isShowSliderText = true
        slider.isEnabled = true

        slider.sliderAnimationVelocity = 0.5
        slider.sliderViewTopDistance = 0.0
        slider.sliderImageViewTopDistance = 5
        slider.sliderImageViewStartingDistance = 5
        slider.sliderTextLabelLeadingDistance = 0
        slider.sliderCornerRadius = baseView.frame.height / 2

        slider.sliderBackgroundColor = UIColor.white
        slider.sliderBackgroundViewTextColor = UIColor.white
        slider.sliderDraggedViewTextColor = DSSlider.dsSliderRedColor()
        slider.sliderDraggedViewBackgroundColor = UIColor.white
        slider.sliderImageViewBackgroundColor = DSSlider.dsSliderRedColor()

        slider.sliderTextFont = UIFont.systemFont(ofSize: 15.0)

        slider.sliderImageView.image = UIImage(named: "sideBtn")
        slider.sliderBackgroundViewTextLabel.text = "SLIDE TO TURN ON!"
        slider.sliderDraggedViewTextLabel.text = "SLIDE TO TURN OFF!"
        
        getGradientLabel(view: slider.sliderBackgroundView)

        view.addSubview(slider)
    }
    
    private func getGradientLabel(view: UIView) {
        let l = CAGradientLayer()
        l.frame = view.bounds
        l.colors = [UIColor.systemRed.cgColor, UIColor.systemYellow.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 30
        view.layer.insertSublayer(l, at: 0)
    }


}

