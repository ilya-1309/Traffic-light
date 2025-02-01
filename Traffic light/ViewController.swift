//
//  ViewController.swift
//  Traffic light
//
//  Created by Ilya Feklin on 29.01.2025.
//

import UIKit

private enum TrafficLight {
    case red, yellow, green
}

final class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight: TrafficLight = .red
    private var lighIsOn = 1.0
    private var lightIsOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
        
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
    

    @IBAction func lightWasOn(_ sender: UIButton) {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .green:
            currentLight = .red
            redLightView.alpha = lighIsOn
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOff
            
        case .red:
            currentLight = .yellow
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lighIsOn
            greenLightView.alpha = lightIsOff
            
        case .yellow:
            currentLight = .green
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lighIsOn
        }
    }
    
}
