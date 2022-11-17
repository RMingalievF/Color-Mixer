//
//  MainController.swift
//  ColorMixer
//
//  Created by Руслан Мингалиев on 29.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
      
    
    @IBOutlet weak var mixerColorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var colorView: UIColor!
    
    override func viewDidLoad() {
        setupSliders()
        setupLabelsConfiguration()
        
        super.viewDidLoad()
        
    }


    @IBAction func rgbSliderAction() {
        changeColor()
        valueRedLabel.text = String(format: "%.2f", redSlider.value)
        valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
        valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    
    
    func changeColor() {
        mixerColorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
// MARK: Private metods
    private func setupLabelsConfiguration() {
        redLabel.textColor = .red
        redLabel.text = "Red"
        valueRedLabel.text = redSlider.value.formatted()
        valueRedLabel.textColor = .red
        
        greenLabel.textColor = .green
        greenLabel.text = "Green"
        valueGreenLabel.text = greenSlider.value.formatted()
        valueGreenLabel.textColor = .green
        
        blueLabel.textColor = .blue
        blueLabel.text = "Blue"
        valueBlueLabel.text = blueSlider.value.formatted()
        valueBlueLabel.textColor = .blue
        
    }
    
    private func setupSliders() {
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
        
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
        
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
    }
    
    private func setupMixerColorView() {
        mixerColorView.backgroundColor = .gray
        mixerColorView.layer.cornerRadius = 10
        
    }
}

