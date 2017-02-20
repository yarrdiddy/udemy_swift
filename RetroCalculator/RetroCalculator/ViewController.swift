//
//  ViewController.swift
//  RetroCalculator
//
//  Created by David Reynolds on 2/11/17.
//  Copyright © 2017 David Reynolds. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    var runningNumber: String?
    var rightValStr: String?
    var leftValStr: String?
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Clear = "ClearContent"
        case Empty = "Empty"
    }
    
    var currentOperation: Operation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetCalculator()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func resetCalculator() {
        runningNumber = ""
        rightValStr = ""
        leftValStr = ""
        currentOperation = Operation.Empty
        outputLbl.text = "0"
    }
    
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        runningNumber! += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    
    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: UIButton) {
        processOperation(operation: currentOperation!)
    }
    
    @IBAction func onClearPressed(_ sender: UIButton) {
        processOperation(operation: .Clear)
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    
    
    func processOperation(operation: Operation) {
        playSound()
        if operation == Operation.Clear {
            resetCalculator()
        } else if currentOperation != Operation.Empty {
            // User selected an operator, but then selected another operator
            if runningNumber != "" {
                guard let running = runningNumber, let left = leftValStr else {
                    return
                }
                rightValStr = running
                runningNumber = ""
                var result = ""
                if currentOperation == Operation.Divide {
                    result = "\(Double(left)! / Double(running)!)"
                } else if currentOperation == Operation.Multiply {
                    result = "\(Double(left)! * Double(running)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(left)! - Double(running)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(left)! + Double(running)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            currentOperation = operation
        } else {
            // This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

