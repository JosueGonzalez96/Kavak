//
//  ProfessionsCell.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import Foundation
import UIKit

class ProfessionsCell: UITableViewCell {
    @IBOutlet weak var labelProfessions: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelExperence: UILabel!
    @IBOutlet weak var imageStars: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    var gnome = Gnome()
    var isProfessions = true
    override func awakeFromNib() {
    }
    func setUI() {
        viewContainer.layer.shadowOpacity = 0.7
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewContainer.layer.shadowRadius = 7.0
        viewContainer.layer.shadowColor = UIColor.darkGray.cgColor
        viewContainer.layer.cornerRadius = 10
        
        if isProfessions {
            let count = gnome.professions.count >= 5 ? 5 : gnome.professions.count
            imageStars.image = UIImage(named: "\(count)Stars")
            labelExperence.text = "Experiencia"
            labelProfessions.text = "Profeciones"
            viewContainer.backgroundColor = hexColor(hex: "009B72")
        } else {
            let count = gnome.friends.count >= 5 ? 5 : gnome.friends.count
            imageStars.image = UIImage(named: "\(count)Stars")
            labelExperence.text = "Amigable"
            labelProfessions.text = "Amigos"
            viewContainer.backgroundColor = hexColor(hex: "FFC857")
        }
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func hexColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
   
}

extension ProfessionsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isProfessions {
             return gnome.professions.count
        }
        return gnome.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfessionsItem", for: indexPath) as! ProfessionsItem
        if isProfessions {
            item.labelName.text = gnome.professions[indexPath.row].name
        } else {
            item.labelName.text = gnome.friends[indexPath.row].name
        }
        return item
    }
    
    
}



