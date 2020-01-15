//
//  CategoriesViewController.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 15/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
            
    let categories: [[String: String]] = [
        ["id": "10", "title": "Books", "image": "Books"],
        ["id": "27", "title": "Animals", "image": "Animals"],
        ["id": "26", "title": "Celebrities", "image": "Celebrities"],
        ["id": "18", "title": "Computers", "image": "Computers"],
        ["id": "9", "title": "General Knowledge", "image": "GeneralKnowledge"],
        ["id": "19", "title": "Math", "image": "Math"],
        ["id": "12", "title": "Music", "image": "Music"],
        ["id": "17", "title": "Science", "image": "Science"],
        ["id": "25", "title": "Art", "image": "Arts"],
        ["id": "28", "title": "Vehicles", "image": "Vehicles"],
        ["id": "21", "title": "Sports", "image": "Sports"],
        ["id": "15", "title": "Games", "image": "VideoGames"],
        ["id": "11", "title": "Films", "image": "Films"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        
        let categoryImageName = category["image"] ?? "Books"
        let categoryImage = UIImage(named: categoryImageName)
        //let categoryTitle = category["title"]
                
        cell.categoryImage = UIImageView(image: categoryImage)
        
        //let text = indexPath.item
        //cell.myLabel.text = text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }

}
