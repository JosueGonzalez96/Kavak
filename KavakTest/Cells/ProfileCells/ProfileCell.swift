//
//  ProfileCell.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import Foundation
import UIKit
class ProfileCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageAvatar: UIImageView!
    
    override func awakeFromNib() {
        setUI()
    }
    
    func setUI() {
        
        imageAvatar.layer.shadowOpacity = 0.7
        imageAvatar.layer.shadowOffset = CGSize(width: 0, height: 3)
        imageAvatar.layer.shadowRadius = 15.0
        imageAvatar.layer.shadowColor = UIColor.darkGray.cgColor
        imageAvatar.layer.cornerRadius = 75
        imageAvatar.layer.borderColor = UIColor.white.cgColor
        imageAvatar.layer.borderWidth = 3
    }
    
}
