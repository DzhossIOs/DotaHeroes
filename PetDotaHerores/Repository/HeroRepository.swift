//
//  HeroRepository.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.
//

import Foundation
protocol HeroRepositoryP {
    func fetchHeroStats(completion: @escaping ([Hero]) -> Void)
}

final class HeroRepository: HeroRepositoryP {
    private let api: HeroApiServiceP
    init(api: HeroApiServiceP) {
        self.api = api
    }

    convenience init() {
        self.init(api: HeroApiService())
    }

    func fetchHeroStats(completion: @escaping ([Hero]) -> Void) {
        api.fetchHeroStats { dtos in
            completion(dtos.map { $0.toDomain() })
        }
    }
}
