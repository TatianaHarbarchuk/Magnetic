//
//  MagneticViewController.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 20.04.2024.
//

import UIKit

final class MagneticViewController: UIViewController {
    
    //MARK: - Properties
    var coordinator: MainCoordinator?
    private var isAnimating = false
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var speedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var animationView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Roboto-Regular", size: 17)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 20)
        button.backgroundColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        setupConstraints()
        searchButton.setTitle("Search", for: .normal)
        searchButton.setTitle("Stop", for: .selected)
    }
    
    //MARK: - Func configureNavigationBar
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Magnetic Detection"
        view.backgroundColor = UIColor(red: 9/255, green: 7/255, blue: 25/255, alpha: 1.0)
        navigationController?.navigationBar.tintColor = UIColor(red: 109/255, green: 89/255, blue: 211/255, alpha: 1.0)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    //MARK: - Func backButtonTapped
    @objc private func backButtonTapped() {
        coordinator?.navigateBackToPreviousView()
    }
    
    //MARK: - Func setupConstraints
    private func setupConstraints() {
        let test = GaugeView(frame: CGRect(x: 100, y: 400, width: 256, height: 256))
        test.backgroundColor = .clear
        view.addSubview(test)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                test.value = 33
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 1) {
                test.value = 66
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 1) {
                test.value = 0
            }
        }
        view.addSubview(imageView)
        view.addSubview(animationView)
        view.addSubview(searchLabel)
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            searchLabel.topAnchor.constraint(equalTo: test.bottomAnchor, constant: 20),
            searchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        searchLabel.text = "Search checking"
        searchButton.setTitleColor(.white, for: .normal)
        imageView.image = UIImage(named: "Frame 14-2")
        searchButton.layer.cornerRadius = 20
        speedImageView.image = UIImage(named: "speed")
    }
}
