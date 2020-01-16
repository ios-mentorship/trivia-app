//
//  CategoriesViewControllerDelegate.swift
//  trivia-app
//
//  Created by Rafael Villarreal on 15/01/20.
//  Copyright © 2020 Rafael Villarreal. All rights reserved.
//

import UIKit

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        
        let categoryImageName = category["image"] ?? "Books"
        let categoryImage = UIImage(named: categoryImageName)
        
        cell.categoryImage.image = categoryImage
        cell.categoryTitle.text = category["title"]
        
        return cell
    }
}
