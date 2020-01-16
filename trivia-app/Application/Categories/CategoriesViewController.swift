//
//  CategoriesViewController.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 15/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
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
        config()
        categoriesCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    }
    
    func config() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }

}
