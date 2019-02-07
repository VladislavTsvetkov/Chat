//
//  ShadowView.swift
//  Chat
//
//  Created by Владислав Цветков on 27/01/2019.
//  Copyright © 2019 Владислав Цветков. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }

}
