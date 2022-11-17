//
//  StartViewController.swift
//  ColorMixer
//
//  Created by Руслан Мингалиев on 16.11.2022.
//

import UIKit

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


