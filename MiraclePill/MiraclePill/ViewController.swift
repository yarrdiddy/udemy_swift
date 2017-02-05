//
//  ViewController.swift
//  MiraclePill
//
//  Created by David Reynolds on 1/23/17.
//  Copyright © 2017 David Reynolds. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    @IBOutlet weak var buyNowButton: UIButton!
    @IBOutlet weak var successIndicator: UIImageView!
    
    let states = ["Alaska", "New York", "California", "New Jersey", "Conecticut"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateButtonPressed(_ sender: Any) {
        countryLabel.isHidden = true
        countryTextField.isHidden = true
        buyNowButton.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeTextField.isHidden = true
        statePicker.isHidden = false
        statePicker.isHidden = false
    }
    
    @IBAction func buyNowButtonPressed(_ sender: Any) {
        for subView in view.subviews {
            subView.isHidden = true
        }
        successIndicator.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryLabel.isHidden = false
        countryTextField.isHidden = false
        buyNowButton.isHidden = false
        zipCodeTextField.isHidden = false
        zipCodeLabel.isHidden = false
    }
}

