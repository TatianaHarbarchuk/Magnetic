//
//  MainCoordinator.swift
//  Magnetic
//
//  Created by Tania Harbarchuk on 18.04.2024.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    func start()
    func navigateToScanningView()
    func navigateToResultView(with devices: [Device])
    func navigateToDetail(device: Device)
    func navigateToMagneticView()
    func navigateBackToPreviousView()
}

final class MainCoordinator: CoordinatorProtocol {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let mainVC = MainViewController()
        mainVC.coordinator = self
        navigationController.setViewControllers([mainVC], animated: false)
    }
    
    func navigateToScanningView() {
        let scanningViewController = ScanningViewController()
        scanningViewController.coordinator = self
        navigationController.pushViewController(scanningViewController, animated: true)
    }
    
    func navigateToResultView(with devices: [Device]) {
        let resultViewController = ResultViewController()
        resultViewController.devices = devices
        resultViewController.coordinator = self
        navigationController.pushViewController(resultViewController, animated: true)
    }
    
    func navigateToDetail(device: Device) {
        let detailViewController = DetailViewController()
        detailViewController.device = device
        detailViewController.coordinator = self
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func navigateBackToPreviousView() {
        navigationController.popViewController(animated: true)
    }
    
    func navigateToMagneticView() {
        let magneticViewController = MagneticViewController()
        magneticViewController.coordinator = self
        navigationController.pushViewController(magneticViewController, animated: true)
    }
}
