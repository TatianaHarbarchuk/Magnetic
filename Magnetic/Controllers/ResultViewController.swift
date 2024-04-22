//
//  ResultViewController.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 19.04.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    private struct Constants {
        static let deviceCell = "DeviceCell"
    }
    //MARK: - Properties
    var coordinator: MainCoordinator?
    
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
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private lazy var wifiNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.textColor = UIColor(red: 82/255, green: 88/255, blue: 120/255, alpha: 1.0)
        label.textAlignment = .center
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
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DeviceCell.self, forCellReuseIdentifier: Constants.deviceCell)
        return tableView
    }()
    
    var devices: [Device] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureNavigationBar()
        setupStackView()
        setupTableView()
    }

    //MARK: - Func setupUI
    private func setupUI() {
        view.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
    }
    
    //MARK: - Func configureNavigationBar
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Result"
        navigationController?.navigationBar.tintColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
    }
    
    //MARK: - Func backButtonTapped
    @objc private func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Func setupStackView
    private func setupStackView() {
        view.addSubview(verticalStackView)
        view.addSubview(horizontalStackView)
        
        horizontalStackView.addArrangedSubview(countLabel)
        horizontalStackView.addArrangedSubview(devicesLabel)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(wifiNameLabel)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        countLabel.text = "\(devices.count)"
        devicesLabel.text = "Devices"
        wifiNameLabel.text = "Wi-Fi_Name"
        
        devicesLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            countLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
            horizontalStackView.distribution = .fill
    }
    
    //MARK: - Func setupTableView
    private func setupTableView() {
        tableView.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.deviceCell, for: indexPath) as? DeviceCell {
            let device = devices[indexPath.row]
            cell.configure(with: device)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDevice = devices[indexPath.row]
        coordinator?.navigateToDetail(device: selectedDevice)
    }
}

