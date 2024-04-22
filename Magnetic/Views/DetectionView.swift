//
//  DetectionView.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 18.04.2024.
//

import UIKit

final class DetectionView: UIView {
    
    // MARK: - Properties
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var detectionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // MARK: - Func setupView
    private func setupView() {
        backgroundColor = UIColor(red: 35/255, green: 23/255, blue: 95/255, alpha: 1.0)
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(detectionButton)
        addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        layer.cornerRadius = 10
    }
    
    // MARK: - Public Methods
    func configure(withImage image: UIImage?, title: String) {
        imageView.image = image
        detectionButton.setTitle(title, for: .normal)
    }
}
