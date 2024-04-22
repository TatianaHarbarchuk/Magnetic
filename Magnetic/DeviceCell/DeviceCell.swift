//
//  DeviceCell.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 19.04.2024.
//

import UIKit

final class DeviceCell: UITableViewCell {
    
    //MARK: - Properties
    private var wifiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var ipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 13)
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
        addSubview(verticalStackView)
        addSubview(wifiImageView)
        addSubview(nextImageView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(ipLabel)
        
        NSLayoutConstraint.activate([
            wifiImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            wifiImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            wifiImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            wifiImageView.widthAnchor.constraint(equalToConstant: 50),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            verticalStackView.leadingAnchor.constraint(equalTo: wifiImageView.trailingAnchor),
            nextImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nextImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            nextImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
    
    //MARK: - Func configure
    func configure(with model: Device) {
        wifiImageView.image = model.image
        nextImageView.image = UIImage(systemName: "chevron.right")
        nameLabel.text = model.title
        ipLabel.text = model.ip
    }
}
