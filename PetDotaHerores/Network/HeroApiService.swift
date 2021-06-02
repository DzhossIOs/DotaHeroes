//
//  HeroApiService.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.
//

import Foundation
protocol HeroApiServiceP {
    func fetchHeroStats(completion: @escaping ([HeroDto]) -> Void)
}

final class HeroApiService: HeroApiServiceP {
    func fetchHeroStats(completion: @escaping ([HeroDto]) -> Void) {
        let url = URL(string: "https://api.opendota.com/api/heroStats") // url path, method, etc
        // network layer - builds requests
        
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
            DispatchQueue.main.async {
                if error == nil {
                    do {
                        let models = try JSONDecoder().decode([HeroDto].self, from: data!) // data proper unwrap
                        completion(models)
                    } catch{
                        completion([])
                    }
                } else {
                    completion([])
                }
            }
        }.resume()
    }
}


