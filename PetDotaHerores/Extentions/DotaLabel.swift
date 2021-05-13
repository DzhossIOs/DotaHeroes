//
//  DotaLabel.swift
//  PetDotaHerores
//
//  Created by Zhastalap Aldanysh on 5/12/21.
//

import UIKit

class DotaLabel: UILabel {
    init() {
        super.init(frame: .zero)
        textAlignment = .center
        font = .monospacedSystemFont(ofSize: 24, weight: .semibold)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
