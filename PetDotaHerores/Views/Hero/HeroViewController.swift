//  HeroViewController.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.

import UIKit
import SnapKit

struct HeroCellModel {
    let name: String
    let primaryAttr: String
    let attackType: String
    let baseArmor: Float
    let img: String
}

class HeroViewController: UIViewController {

    private let viewModel: HeroViewModel
    var heroCellModel:HeroCellModel?
    let imageView = UIImageView()
    let heroType = DotaLabel()
    let heroBaseArmor = DotaLabel()
    let heroAttackType = DotaLabel()
    
   
    init(viewModel: HeroViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setHeirarchy()
        setContraints()
        bind()
        viewModel.viewDidLoad()
        
    }
    private func bind() {
        viewModel.heroCellModel.bind { [weak self] heroCellModel in
            self?.heroCellModel = heroCellModel
            self?.updateViews()
        }
    }

    func updateViews() {
        if (heroCellModel?.primaryAttr)! == "int"{
            view.backgroundColor = .cyan
        } else if  (heroCellModel?.primaryAttr)! == "str"{
            view.backgroundColor = .red
        } else if (heroCellModel?.primaryAttr)! == "agi"{
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .systemBackground
        }
        let titletext = heroCellModel?.name
        title = titletext
        let urlString = "https://api.opendota.com" + (heroCellModel?.img)!
        let url = URL(string: urlString)
        imageView.downloaded(from: url!)
        heroType.text = heroCellModel?.primaryAttr.capitalized
        heroBaseArmor.text = "Armor: \((heroCellModel?.baseArmor)!)"
        heroAttackType.text = heroCellModel?.attackType.capitalized
       
    }
    
    func setViews(){
        
    }
    func setHeirarchy(){
        view.addSubview(imageView)
        view.addSubview(heroType)
        view.addSubview(heroBaseArmor)
        view.addSubview(heroAttackType)
    }
    func setContraints(){
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
       }
        
        heroType.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        heroBaseArmor.snp.makeConstraints { (make) in
            make.top.equalTo(heroType.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        heroAttackType.snp.makeConstraints { (make) in
            make.top.equalTo(heroBaseArmor.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
    /*init(hero: HeroStats) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }*/
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
