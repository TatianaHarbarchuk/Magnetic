//
//  ScanningViewController.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 18.04.2024.
//

import UIKit
import Lottie

final class ScanningViewController: UIViewController {
    
    //MARK: - Properties
    var coordinator: MainCoordinator?
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let animationView = LottieAnimationView(name: "hc6 s")
    
    private lazy var scanningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .white
        return label
    }()
    
    private lazy var wifiNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        return label
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        label.textAlignment = .right
        return label
    }()
    
    private lazy var devicesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 20)
        button.backgroundColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private var devices: [Device] = [
        Device(title: "-", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "Mac-Tick", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "error")),
        Device(title: "Iphone", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "MS", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "NFG", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "error")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")), Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon")),
        Device(title: "JGf", ip: "192.168.1.1", connection: "WI-FI", macAddress: "Not available", hostName: "gwpc-21141234.local", image: UIImage(named: "icon"))]
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        createStackView()
        setupImageView()
        setupButton()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.coordinator?.navigateToResultView(with: self.devices)
        }
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    //MARK: - viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //MARK: - Func setupUI
    private func setupUI() {
        view.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
        view.addSubview(animationView)
        view.addSubview(stopButton)
    }
    
    //MARK: - Func createStackView
    private func createStackView() {
        view.addSubview(verticalStackView)
        view.addSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(scanningLabel)
        verticalStackView.addArrangedSubview(wifiNameLabel)
        horizontalStackView.addArrangedSubview(countLabel)
        horizontalStackView.addArrangedSubview(devicesLabel)
        
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            verticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08),
            horizontalStackView.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -40),
            horizontalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05),
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        scanningLabel.text = "Scanning your Wi-Fi"
        wifiNameLabel.text = "TLind_246_lp"
        countLabel.text = "23"
        devicesLabel.text = "Devices found..."
        
        devicesLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        countLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        horizontalStackView.distribution = .fill
    }
    
    //MARK: - Func setupImageView
    private func setupImageView() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: -10),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            animationView.bottomAnchor.constraint(equalTo: horizontalStackView.topAnchor)
        ])
        
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        animationView.play()
    }
    
    //MARK: - Func setupButton
    private func setupButton() {
        NSLayoutConstraint.activate([
            stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            stopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stopButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stopButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        stopButton.setTitle("Stop", for: .normal)
        stopButton.layer.cornerRadius = 20
    }
}
