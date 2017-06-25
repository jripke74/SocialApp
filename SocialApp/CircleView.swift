//
//  CircleView.swift
//  SocialApp
//
//  Created by Jeff Ripke on 6/11/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
