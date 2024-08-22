//
//  UIBuilder.swift
//  UIKit - 11 - dz
//
//  Created by Олег Дмитриев on 22.08.2024.
//

import UIKit

class UIBuilder {
    
    func addLabel(text: String, fontS: CGFloat, fontW: UIFont.Weight, line: Int = 0, color: UIColor = .appBlack) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        
        txt.text = text
        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.numberOfLines = line
        
        txt.textColor = color
        
        return txt
    }
    
    func addImage(image: String, brs: CGFloat = 0) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        
        img.image = UIImage(named: image)
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = brs
        img.layer.masksToBounds = true
        
        return img
    }
    
    func addIconBtn(image: UIImage, text: String = "") -> UIButton {
        let btn = UIButton()

        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 64).isActive = false
        btn.heightAnchor.constraint(equalToConstant: 30).isActive = false
        
        btn.setTitle(text, for: .normal)
        btn.setImage(image, for: .normal)
        
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .appGrayText
        
        btn.layer.cornerRadius = 16
        
        return btn
    }
    
}
