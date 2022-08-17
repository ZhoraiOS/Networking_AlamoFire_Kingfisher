//
//  UIImageViewExtension.swift
//  Networking_AlamoFire
//
//  Created by Zhora Babakhanyan on 8/17/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(imageURL: String) {
        self.kf.setImage(with: URL(string: imageURL))
    }
}
