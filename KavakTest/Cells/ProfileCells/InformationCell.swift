//
//  InformationCell.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import Foundation
import UIKit

class InformationCell: UITableViewCell {
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelWeight: UILabel!
    @IBOutlet weak var labelHeight: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    var gnome = Gnome()
    
    func setUI() {
        viewContainer.layer.shadowOpacity = 0.7
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewContainer.layer.shadowRadius = 15.0
        viewContainer.layer.shadowColor = UIColor.darkGray.cgColor
        viewContainer.layer.cornerRadius = 10
        hairColor.text = "Color de Pelo: \(gnome.hair_color ?? "")"
        labelAge.text = "Edad: \(gnome.age ?? 0)"
        labelHeight.text = "Altura: \(gnome.height ?? 0)"
        labelWeight.text = "Peso:\(gnome.weight ?? 0)"
        
    }
   
}
