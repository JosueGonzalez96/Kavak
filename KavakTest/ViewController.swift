//
//  ViewController.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var isImage = false
    var arrGnome = [Gnome]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Buscar"
        search.delegate = self
        self.navigationItem.searchController = search
        self.title = "Brastlewark"
        
        for _ in 1...10 {
            var gno = Gnome()
            gno.name = "Tobus Quickwhistle"
            gno.weight = Int(35.279167)
            gno.height = Int(110.43628)
            gno.thumbnail = "http://www.publicdomainpictures.net/pictures/120000/nahled/white-hen.jpg"
            gno.hair_color = "Pink"
            gno.age = 288
            for _ in 1...20 {
                gno.friends.append(GnomeFriends(name: "Josue"))
                gno.professions.append(GnomeProfessions(name: "Josue"))
            }
            arrGnome.append(gno)
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProfileVC {
            vc.gnome = arrGnome[0]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return arrGnome.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemGnome", for: indexPath) as! ItemGnome
            item.image.image = UIImage(named: "Image-1")
        item.name.text = arrGnome[indexPath.row].name
        
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 3)
        return size
    }
}
extension ViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
    }
}


class ItemGnome: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
}
struct Gnome {
    var id = Int()
    var name = String()
    var age = Int()
    var thumbnail = String()
    var weight = Int()
    var height = Int()
    var hair_color = String()
    var professions = [GnomeProfessions]()
    var friends = [GnomeFriends]()
}
struct GnomeProfessions {
    var name = String()
}
struct GnomeFriends {
    var name = String()
}
