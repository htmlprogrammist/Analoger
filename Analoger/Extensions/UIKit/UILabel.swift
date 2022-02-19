//
//  UILabel.swift
//  Analoger
//
//  Created by Егор Бадмаев on 22.01.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        self.font = UIFont.systemFont(ofSize: 18, weight: .bold) // подобрать так, чтобы размер был такой же, но был bold или medium
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
