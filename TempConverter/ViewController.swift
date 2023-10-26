//
//  ViewController.swift
//  TempConverter
//
//  Created by Артур Олехно on 27/10/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var tempSegementControl: UISegmentedControl!
    @IBOutlet weak var tempSlider: UISlider!{
        didSet {
            tempSlider.value = 0
            tempSlider.minimumValue = 0
            tempSlider.maximumValue = 100
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertedLabel.text = "32 °F"
    }

    @IBAction func sliderValueChange(_ sender: Any) {
        updateTempLabelFromSlider(value: tempSlider.value)
    }
    
    @IBAction func navigationButton(_ sender: Any) {
        let vc = InfoViewController()
        vc.configure(with: convertedLabel.text ?? "Result")
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func updateTempLabelFromSlider(value: Float) {
        celsiusLabel.text = "\(String(value)) °C"
        let result: (Double, Double) = covertTempFrom(celsius: Double(value))
        switch tempSegementControl.selectedSegmentIndex {
        case 0:
            convertedLabel.text = "\(String(result.0)) °F"
        case 1:
            convertedLabel.text = "\(String(result.1)) °K"
        default:
            print("Some Error")
        }
    }
    
    func covertTempFrom(celsius: Double) -> (fahrnheit: Double, kelvin: Double){
        let result: (Double, Double)
        result.0 = (celsius * 9 / 5) + 32
        result.1 = celsius + 273.15
        return result
    }
}

