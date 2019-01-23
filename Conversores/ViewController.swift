//
//  ViewController.swift
//  Conversores
//
//  Created by Gabriel Guerrero on 1/23/19.
//  Copyright © 2019 Gabriel Guerrero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - @IBOutlet's
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var unit1Button: UIButton!
    @IBOutlet weak var unit2Button: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultUnitLabel: UILabel!
    
    //MARK: - @IBAction's
    @IBAction func onShowNextClick(_ sender: UIButton) {
        switch unitLabel.text! {
            case "Temperatura":
                unitLabel.text = "Peso"
                unit1Button.setTitle("Quilograma", for: .normal)
                unit2Button.setTitle("Libra", for: .normal)
            case "Peso":
                unitLabel.text = "Moeda"
                unit1Button.setTitle("Real", for: .normal)
                unit2Button.setTitle("Dolar", for: .normal)
            case "Moeda":
                unitLabel.text = "Distância"
                unit1Button.setTitle("Metro", for: .normal)
                unit2Button.setTitle("Quilometro", for: .normal)
            default:
                unitLabel.text = "Temperatura"
                unit1Button.setTitle("Celsius", for: .normal)
                unit2Button.setTitle("Farenheint", for: .normal)
        }
        onConvertClick(nil)
    }
    
    @IBAction func onConvertClick(_ sender: UIButton?) {
        if let _sender = sender {
            if _sender == unit1Button {
                unit2Button.alpha = 0.5
            } else {
                unit1Button.alpha = 0.5
            }
            _sender.alpha = 1.0
        }
        
        switch unitLabel.text! {
        case "Temperatura":
            calcTemperature()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistance()
        }
        view.endEditing(true)
        let result = Double(resultLabel.text!)
        resultLabel.text = String(format: "%.2f", result!)
    }
    
    //MARK: - Private Method's
    private func calcTemperature() {
        guard let temperature = Double(valueTextField.text!) else {return}
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Farenheint"
            resultLabel.text = String(temperature * 1.8 + 32.0)
        } else {
            resultUnitLabel.text = "Celsius"
            resultLabel.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    private func calcWeight() {
        guard let weight = Double(valueTextField.text!) else {return}
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Libra"
            resultLabel.text = String(weight / 2.2046)
        } else {
            resultUnitLabel.text = "Quilograma"
            resultLabel.text = String(weight * 2.2046)
        }
    }
    
    private func calcCurrency() {
        guard let currency = Double(valueTextField.text!) else {return}
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Dolar"
            resultLabel.text = String(currency / 3.5)
        } else {
            resultUnitLabel.text = "Real"
            resultLabel.text = String(currency * 3.5)
        }
    }
    
    private func calcDistance() {
        guard let distance = Double(valueTextField.text!) else {return}
        
        if unit1Button.alpha == 1.0 {
            resultUnitLabel.text = "Quilometro"
            resultLabel.text = String(distance / 1000.0)
        } else {
            resultUnitLabel.text = "Metros"
            resultLabel.text = String(distance * 1000.0)
        }
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

