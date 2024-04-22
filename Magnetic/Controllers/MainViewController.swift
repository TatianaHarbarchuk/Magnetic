//
//  ViewController.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 18.04.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Constants
    private struct Constants {
        static let spacing: CGFloat = 40
        static let height: CGFloat = 20
        static let width: CGFloat = 30
        static let cornerRadius: CGFloat = 10
    }
    //MARK: - Properties
    var coordinator: MainCoordinator?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var firstHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = Constants.spacing
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = Constants.spacing
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Constants.spacing
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var detectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
        return view
    }()
    
    private lazy var scanView: ScanView = {
        let view = ScanView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var infraredView: DetectionView = {
        let view = DetectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var magneticView: DetectionView = {
        let view = DetectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bluetoothView: DetectionView = {
        let view = DetectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var antispyTipsView: DetectionView = {
        let view = DetectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupImageView()
        setupScanView()
        DispatchQueue.main.async { [weak self] in
            self?.setupDetectionViews()
        }
    }
    
    //MARK: - Func setupNavigationBar
    private func setupNavigationBar() {
        view.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "slider.vertical.3"), style: .plain, target: self, action: nil)
        settingsButton.tintColor = .white
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    //MARK: - Func setupImageView
    private func setupImageView() {
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        imageView.image = UIImage(named: "Frame 14")
    }
    
    //MARK: - Func setupScanView
    private func setupScanView() {
        view.addSubview(scanView)
        
        NSLayoutConstraint.activate([
            scanView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.height),
            scanView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.height),
            scanView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.height),
            scanView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
        scanView.layer.cornerRadius = Constants.cornerRadius
        scanView.scanButton.addTarget(self, action: #selector(didTapScanButton), for: .touchUpInside)
    }
    
    //MARK: - Func didTapScanButton
    @objc private func didTapScanButton() {
        coordinator?.navigateToScanningView()
    }
    
    //MARK: - Func setupDetectionViews
    private func setupDetectionViews() {
        infraredView.configure(withImage: UIImage(named: "infrared"), title: "Infrared Detection")
        magneticView.configure(withImage: UIImage(named: "magnetic"), title: "Magnetic Detection")
        bluetoothView.configure(withImage: UIImage(named: "bluetooth"), title: "Bluetooth Detection")
        antispyTipsView.configure(withImage: UIImage(named: "antispy"), title: "Antispy Tips")
        
        firstHorizontalStackView.addArrangedSubview(infraredView)
        firstHorizontalStackView.addArrangedSubview(bluetoothView)
        secondHorizontalStackView.addArrangedSubview(magneticView)
        secondHorizontalStackView.addArrangedSubview(antispyTipsView)
        
        verticalStackView.addArrangedSubview(firstHorizontalStackView)
        verticalStackView.addArrangedSubview(secondHorizontalStackView)
        
        detectionView.addSubview(verticalStackView)
        
        view.addSubview(detectionView)
        
        NSLayoutConstraint.activate([
            detectionView.topAnchor.constraint(equalTo: scanView.bottomAnchor, constant: 10),
            detectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.width),
            detectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.width),
            detectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: detectionView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: detectionView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: detectionView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: detectionView.bottomAnchor),
            
            firstHorizontalStackView.heightAnchor.constraint(equalTo: verticalStackView.heightAnchor, multiplier: 0.5),
            secondHorizontalStackView.heightAnchor.constraint(equalTo: verticalStackView.heightAnchor, multiplier: 0.5),
            
            infraredView.heightAnchor.constraint(equalTo: infraredView.widthAnchor, multiplier: 0.8),
            magneticView.heightAnchor.constraint(equalTo: magneticView.widthAnchor, multiplier: 0.8),
            bluetoothView.heightAnchor.constraint(equalTo: bluetoothView.widthAnchor, multiplier: 0.8),
            antispyTipsView.heightAnchor.constraint(equalTo: antispyTipsView.widthAnchor, multiplier: 0.8)
        ])
        
        magneticView.detectionButton.addTarget(self, action: #selector(didTapMagneticButton), for: .touchUpInside)
    }
    
    //MARK: - Func didTapMagneticButton
    @objc private func didTapMagneticButton() {
        coordinator?.navigateToMagneticView()
    }
}

