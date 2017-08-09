//
//  ViewController.swift
//  window-shopper
//
//  Created by Benjamin Budian on 8/9/17.
//  Copyright © 2017 ThisGuyMagic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var wageTextField: CurrencyTextField!
    @IBOutlet weak var priceTextField: CurrencyTextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        calcButton.addTarget(self, action: #selector(MainViewController.calculate), for: .touchUpInside)
        
        wageTextField.inputAccessoryView = calcButton
        priceTextField.inputAccessoryView = calcButton
        
        hideShowLabels(isHidden: true)
    }
    
    func hideShowLabels(isHidden: Bool){
        resultLabel.isHidden = isHidden
        hoursLabel.isHidden = isHidden
    }
    
    @objc func calculate(){
        if let wageText = wageTextField.text, let priceText = priceTextField.text{
            if let wage = Double(wageText), let price = Double(priceText){
                view.endEditing(true)
                hideShowLabels(isHidden: false)
                resultLabel.text = "\(Wage.getHours(forWage: wage, andPrice: price))"
            }
        }
    }
    
    @IBAction func clearCalculatorPressed(_ sender: Any) {
        hideShowLabels(isHidden: true)
        wageTextField.text = ""
        priceTextField.text = ""
    }
}

