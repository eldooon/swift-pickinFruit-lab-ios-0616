//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fruitPicker.accessibilityLabel = Constants.FRUIT_PICKER
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
        
        self.fruitPicker.dataSource = self
        self.fruitPicker.delegate = self
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruitsArray[row]
    }
    
    @IBAction func spinButtonTapped(sender: UIButton) {
        
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 0, animated: true)
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 1, animated: true)
        self.fruitPicker.selectRow(Int(arc4random_uniform(9)), inComponent: 2, animated: true)
        
        checkWin()
        
    }
    
    func checkWin(){
        if self.fruitPicker.selectedRowInComponent(0) == self.fruitPicker.selectedRowInComponent(1) && self.fruitPicker.selectedRowInComponent(1) == self.fruitPicker.selectedRowInComponent(2) {
            
            self.resultLabel.text = "WINNER"
        }
        
        else {
            self.resultLabel.text = "TRY AGAIN"
        }
    }
    
}

// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



