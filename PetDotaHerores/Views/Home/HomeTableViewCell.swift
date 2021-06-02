//
//  HomeTableViewCell.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/14/21.
//

import UIKit
import SnapKit

class HomeTableViewCell: UITableViewCell {
    
    var iconImage = UIImageView()
    let textHero = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setHeirarchy()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    private func setViews() {
        accessoryType = .disclosureIndicator
        
    }
    private func setHeirarchy() {
        addSubview(iconImage)
        addSubview(textHero)
    }
    private func setContraints() {
        iconImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
       }
        textHero.snp.makeConstraints { (make) in
            make.left.equalTo(iconImage.snp.left).offset(50)
            make.centerY.equalToSuperview()
       }
        
    }
}
