//
//  ScanView.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 18.04.2024.
//

import UIKit

final class ScanView: UIView {
    
    //MARK: - Properties
    lazy var scanButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 20)
        button.backgroundColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private lazy var scanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = UIColor(red: 82/255, green: 88/255, blue: 120/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var wifiNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        label.shadowColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 0.55)
        label.layer.shadowRadius = 5
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.layer.shadowOpacity = 0.8
        label.layer.masksToBounds = false
        return label
    }()
    
    private lazy var currentWifiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    //MARK: - Func setup
    private func setup() {
        backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1.0)
        addSubview(scanButton)
        addSubview(scanLabel)
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(currentWifiLabel)
        verticalStackView.addArrangedSubview(wifiNameLabel)
        
        scanLabel.text = "Ready to scan this network"
        currentWifiLabel.text = "Current WI-FI"
        wifiNameLabel.text = "WiFi_Name"
        scanButton.setTitle("Scan current network", for: .normal)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3),
            
            scanLabel.bottomAnchor.constraint(equalTo: scanButton.topAnchor, constant: -5),
            scanLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            scanLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            scanButton.topAnchor.constraint(equalTo: scanLabel.bottomAnchor, constant: 5),
            scanButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            scanButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            scanButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            scanButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
        scanButton.layer.cornerRadius = 25
    }
}
