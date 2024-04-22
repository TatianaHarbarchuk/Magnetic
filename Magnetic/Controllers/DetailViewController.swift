//
//  DetailViewController.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 20.04.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    //MARK: - Properties
    var device: Device?
    var coordinator: MainCoordinator?
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var detailView: DetailView = {
        let view = DetailView(frame: .zero, device: device)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        detailView.device = device
        detailView.tableView.reloadData()
    }
    
    //MARK: - Func setupUI
    private func setupUI() {
        navigationItem.title = "Device Details"
        view.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
        
        navigationController?.navigationBar.tintColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        
        view.addSubview(imageView)
        view.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            detailView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])
        
        imageView.image = (device?.image == UIImage(named: "error")) ? UIImage(named: "bad connection") : UIImage(named: "good connection")
        detailView.layer.cornerRadius = 10
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK: - Func backButtonTapped
    @objc private func backButtonTapped() {
        coordinator?.navigateBackToPreviousView()
    }
}
