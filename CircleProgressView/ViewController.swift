//
//  ViewController.swift
//  CircleProgressView
//
//  Created by Eric Rolf on 8/11/14.
//  Copyright (c) 2014 Eric Rolf, Cardinal Solutions Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var circleProgressView: CircleProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var clockwiseSwitch: UISwitch!
    
    let nf = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

        nf.numberStyle = NumberFormatter.Style.decimal
        nf.maximumFractionDigits = 2
        
        self.clockwiseSwitch.setOn(self.circleProgressView.clockwise, animated: false)
        self.progressSlider.value = Float(self.circleProgressView.progress)
        self.progressLabel.text = "Progress: " + nf.string(from: NSNumber(value: self.circleProgressView.progress))!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - IBActions

    @IBAction func sliderDidChangeValue(_ sender: UISlider) {
        
    self.circleProgressView.progress = Double(sender.value)
    self.progressLabel.text = "Progress: " + nf.string(from: NSNumber(value: self.circleProgressView.progress))!
    }
    
    @IBAction func switchDidChangeValue(_ sender: UISwitch) {
        self.circleProgressView.clockwise = sender.isOn
        self.circleProgressView.progress = self.circleProgressView.progress
    }
    
    // MARK: - Helpers
    func delay(delay:Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: closure)
    }

}
    

