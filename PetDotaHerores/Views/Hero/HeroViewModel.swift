//
//  HeroViewModel.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.
//

import UIKit

final class HeroViewModel {
    private let hero: Hero
    private(set) var heroCellModel: Box<HeroCellModel?> = .init(nil)

    init(hero: Hero) {
        self.hero = hero
    }

    func viewDidLoad() {
        heroCellModel.value = HeroCellModel(name: hero.localized_name, primaryAttr: hero.primary_attr, attackType: hero.attack_type, baseArmor: hero.base_armor, img: hero.img)
    }
}
