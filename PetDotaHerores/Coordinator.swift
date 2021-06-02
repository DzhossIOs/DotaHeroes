//
//  Coordinator.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.
//

import Foundation
import UIKit

final class Coordinator {
    private let navigationController = UINavigationController()
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .label
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

    func start() {
        let viewModel = HomeViewModel(route: openDetails)
        let view = HomeViewController(viewModel: viewModel)
        navigationController.setViewControllers([view], animated: true)
    }
}

private extension Coordinator {
    func openDetails(hero: Hero){
        let vc = HeroViewController(viewModel: HeroViewModel(hero: hero))
        navigationController.pushViewController(vc, animated: true)
    }
}
