//
//  StartViewController.swift
//  ColorMixer
//
//  Created by Руслан Мингалиев on 16.11.2022.
//

import UIKit

protocol MainViewControllerDelrgate {
    func changeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat )
}

class StartViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let startVC = segue.destination as? MainViewController else { return }
        startVC.colorView = view.backgroundColor
    }



    @IBAction func pressButton(_ sender: UIButton) {
    }
}

extension StartViewController: MainViewControllerDelrgate {
    func changeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
     
}

