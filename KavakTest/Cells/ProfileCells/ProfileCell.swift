//
//  ProfileCell.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class ProfileCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    var gnome = Gnome()

    func setUI() {
        
        imageAvatar.layer.shadowOpacity = 0.7
        imageAvatar.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageAvatar.layer.shadowRadius = 15.0
        imageAvatar.layer.shadowColor = UIColor.darkGray.cgColor
        imageAvatar.layer.cornerRadius = 75
        imageAvatar.layer.borderColor = GeneralMethods.getColor(color: self.gnome.hair_color ?? "").cgColor
        imageAvatar.layer.borderWidth = 3
        labelName.text = gnome.name
        guard let urlImage = gnome.thumbnail else { return }
        imageAvatar.sd_setImage(with: URL(string: urlImage), placeholderImage: UIImage(named: "Image-1"))
        
    }
    
}
