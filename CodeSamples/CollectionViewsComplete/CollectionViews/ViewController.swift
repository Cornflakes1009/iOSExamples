//
//  ViewController.swift
//  CollectionViews
//
//  Created by HaroldDavidson on 3/26/19.
//  Copyright © 2019 HaroldDavidson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let arrayOfData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //MARK: Creating custom view for each image in the collection view
        // getting the width of the screen, dividing it by 3, and subtracting 3pts for spacing between each item
        let itemSize = UIScreen.main.bounds.width / 3 - 3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        myCollectionView.collectionViewLayout = layout
    }


    // number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfData.count
    }
    
    //POPULATE VIEWS
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.myImageView.image = UIImage(named: arrayOfData[indexPath.row] + ".JPG")
        return cell
        
    }
}

