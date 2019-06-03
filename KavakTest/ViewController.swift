//
//  ViewController.swift
//  KavakTest
//
//  Created by Alberto Josue Gonzalez on 5/29/19.
//  Copyright © 2019 Alberto Josue Gonzalez. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var isImage = false
    var arrGnome = [Gnome]()
    var arrFilter = [Gnome]()
    var index = 0
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
        getGnomes()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getGnomes() {
        let service = ServiceCall()
        service.initWithURl { (success, obj) in
            if  success {
                guard let arr = obj as? [Gnome] else { return }
                self.arrGnome = arr
                self.arrFilter = self.arrGnome
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {
                
            }
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProfileVC {
            vc.gnome = arrFilter[index]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemGnome", for: indexPath) as! ItemGnome
        item.name.text = arrFilter[indexPath.row].name
        guard let urlImage = arrFilter[indexPath.row].thumbnail else { return item }
        item.image.sd_setImage(with: URL(string: urlImage), placeholderImage: UIImage(named: "Image-1"))

        
        return item
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        self.performSegue(withIdentifier: "ShowProfileSegue", sender: nil)
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
        let text = searchController.searchBar.text
        if text == "" {
            arrFilter = arrGnome
            collectionView.reloadData()
            return
        }
        
        arrFilter = arrFilter.filter({
            ($0.name?.lowercased().contains(text!.lowercased()))!
        })
        arrFilter =  arrFilter.count == 0 ? arrGnome :  arrFilter
        collectionView.reloadData()
    }
}


class ItemGnome: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
}

import ObjectMapper
class Gnome: Mappable {
 
    var id: Int?
    var name: String?
    var age: Int?
    var thumbnail: String?
    var weight: Int?
    var height: Int?
    var hair_color: String?
    var professions = [String]()
    var friends = [String]()
    init(){}
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        age <- map["age"]
        thumbnail <- map["thumbnail"]
        weight <- map["weight"]
        height <- map["height"]
        hair_color <- map["hair_color"]
        professions <- map["professions"]
        friends <- map["friends"]
    }
}
