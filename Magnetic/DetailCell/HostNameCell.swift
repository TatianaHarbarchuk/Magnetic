//
//  HostNameCell.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 20.04.2024.
//

import UIKit

final class HostNameCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var hostNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var hostNameValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.textColor = UIColor(red: 82/255, green: 88/255, blue: 120/255, alpha: 1.0)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var hostNameStackView: UIStackView = {
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
        addSubview(hostNameStackView)
        
        hostNameStackView.addArrangedSubview(hostNameLabel)
        hostNameStackView.addArrangedSubview(hostNameValueLabel)
        
        NSLayoutConstraint.activate([
            hostNameStackView.topAnchor.constraint(equalTo: topAnchor),
            hostNameStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hostNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hostNameStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            hostNameLabel.widthAnchor.constraint(equalTo: hostNameValueLabel.widthAnchor)
        ])
    }
    
    //MARK: - Func configureCell
    func configureCell(with model: Device) {
        hostNameValueLabel.text = model.hostName
        hostNameLabel.text = "Hostname"
    }
}
