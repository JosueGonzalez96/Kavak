//
//  ProfileVC.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var tableViewProfile: UITableView!
    var gnome = Gnome()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = gnome.name
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
             return 212
        } else if indexPath.row == 1 {
            return 127
        } else if indexPath.row == 2 {
            return 171
        } else {
            return 171
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
            cell.gnome = self.gnome
            cell.setUI()
            return cell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as! InformationCell
            cell.gnome =  self.gnome
            cell.setUI()
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessionsCell") as! ProfessionsCell
            cell.isProfessions = true
            cell.gnome = gnome
            cell.setUI()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessionsCell") as! ProfessionsCell
            cell.isProfessions = false
            cell.gnome = gnome
            cell.setUI()
            return cell
        }
    }
    
    
}




