//
//  InfoViewController.swift
//  TempConverter
//
//  Created by Артур Олехно on 27/10/2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(resultLabel)
        applyConstrains()
        // Do any additional setup after loading the view.
    }
    
    func applyConstrains() {
        let resultLabelConstrain = [
            resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        NSLayoutConstraint.activate(resultLabelConstrain)
    }
    
    public func configure(with label: String) {
        resultLabel.text = label
    }
}
