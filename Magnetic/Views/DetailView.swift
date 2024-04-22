//
//  DetailView.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 20.04.2024.
//

import UIKit

final class DetailView: UIView {
    
    private struct Constants {
        static let connectionCell = "ConnectionCell"
        static let ipCell = "IPCell"
        static let macAddressCell = "MacAddressCell"
        static let hostNameCell = "HostNameCell"
    }
    //MARK: - Properties
    var device: Device?
    
    private lazy var cameraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Bold", size: 28)
        label.textColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var ipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 15)
        label.textColor = .white
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
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ConnectionCell.self, forCellReuseIdentifier: Constants.connectionCell)
        tableView.register(IPCell.self, forCellReuseIdentifier: Constants.ipCell)
        tableView.register(MacAddressCell.self, forCellReuseIdentifier: Constants.macAddressCell)
        tableView.register(HostNameCell.self, forCellReuseIdentifier: Constants.hostNameCell)
        return tableView
    }()
    
    //MARK: - Initialization
    init(frame: CGRect, device: Device?) {
        super.init(frame: frame)
        self.device = device
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    //MARK: - Func setup
    private func setup() {
        backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1.0)
        
        verticalStackView.addArrangedSubview(cameraLabel)
        verticalStackView.addArrangedSubview(ipLabel)
        
        addSubview(verticalStackView)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        tableView.backgroundColor = UIColor(red: 16/255, green: 13/255, blue: 44/255, alpha: 1.0)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        cameraLabel.text = "Camera"
        tableView.isScrollEnabled = false
        ipLabel.text = device?.ip
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let device = device else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.connectionCell, for: indexPath) as? ConnectionCell {
                cell.configureCell(with: device)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ipCell, for: indexPath) as? IPCell {
                cell.configureCell(with: device)
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.macAddressCell, for: indexPath) as? MacAddressCell {
                cell.configureCell(with: device)
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.hostNameCell, for: indexPath) as? HostNameCell {
                cell.configureCell(with: device)
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
}
