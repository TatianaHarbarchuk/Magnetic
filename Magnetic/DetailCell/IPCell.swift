//
//  IPCell.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 20.04.2024.
//

import UIKit

final class IPCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var ipAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var ipValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = UIColor(red: 82/255, green: 88/255, blue: 120/255, alpha: 1.0)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var ipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    //MARK: - Func setup
    private func setup() {
        backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1.0)
        addSubview(ipStackView)
        
        ipStackView.addArrangedSubview(ipAddressLabel)
        ipStackView.addArrangedSubview(ipValueLabel)
        
        NSLayoutConstraint.activate([
            ipStackView.topAnchor.constraint(equalTo: topAnchor),
            ipStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ipStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ipStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ipAddressLabel.widthAnchor.constraint(equalTo: ipValueLabel.widthAnchor)
        ])
    }
    
    //MARK: - Func configureCell
    func configureCell(with model: Device) {
        ipValueLabel.text = model.ip
        ipAddressLabel.text = "IP Address"
    }
}
