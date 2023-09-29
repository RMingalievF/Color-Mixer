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
    var delegate: MainViewControllerDelrgate!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelsConfiguration()
        mixerColorView.layer.cornerRadius = 10
        mixerColorView.backgroundColor = colorView
        setupSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        
    }


    @IBAction func rgbSliderAction() {
        changeColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    
    @IBAction func pressButtonDone() {
        dismiss(animated: true)
        delegate?.changeColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value) , alpha: 1)
        
    }
    
    // MARK: Private metods
    private func changeColor() {
        mixerColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                valueRedLabel.text = String(format: "%.2f", redSlider.value)
            case greenLabel:
                valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
            default:
                valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }

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
        redSlider.value = Float((mixerColorView.backgroundColor?.components.red)!)
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
        
        greenSlider.value = Float((mixerColorView.backgroundColor?.components.green)!)
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
        
        blueSlider.value = Float((mixerColorView.backgroundColor?.components.blue)!)
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
    }
    
    
    

}

extension UIColor {
    var coreViewColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreViewColor = self.coreViewColor
        return (coreViewColor.red, coreViewColor.green, coreViewColor.blue, coreViewColor.alpha)
    }
}
