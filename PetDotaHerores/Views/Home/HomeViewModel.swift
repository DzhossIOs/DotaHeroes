//
//  HomeViewModel.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.

import Foundation

final class HomeViewModel {
    private var heroes: [Hero] = []
    private(set) var cellModels: Box<[HomeCellModel]> = .init([])

    private let repo: HeroRepositoryP // to be injected

    private let route: (Hero) -> Void

    init(repo: HeroRepositoryP, route: @escaping (Hero) -> Void) {
        self.repo = repo
        self.route = route
    }

    convenience init(route: @escaping (Hero) -> Void) {
        self.init(repo: HeroRepository(), route: route)
    }

    func viewDidLoad() {
        repo.fetchHeroStats { [weak self] heroes in
            self?.heroes = heroes
            self?.cellModels.value = heroes.map { .init(text: $0.localized_name.capitalized) }
        }
    }

    func didSelectAtRow(index: Int) {
        route(heroes[index])
    }
}
