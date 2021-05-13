//  HeroStats.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.

import Foundation

struct Hero: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let img: String
    let base_armor: Float

    // to use CodingKeys
}

struct HeroDto: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let img: String
    let base_armor: Float

    func toDomain() -> Hero {
        .init(localized_name: localized_name, primary_attr: primary_attr, attack_type: attack_type, img: img, base_armor: base_armor)
    }

    // to use CodingKeys
}
