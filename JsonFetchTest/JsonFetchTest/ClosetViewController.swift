//
//  ClosetViewController.swift
//  JsonFetchTest
//
//  Created by Richard Hong on 12/27/16.
//  Copyright © 2016 Richard Hong. All rights reserved.
//

import UIKit

class ClosetViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var closetMainImage: UIImageView?
    
    let reuseIdentifier = "cell"
    
    
    var items = closetArray
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ClosetCollectionViewCell
        
        //        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        let index = indexPath.item
        
        let imageURL = URL(string: self.items[index])
        
        let data = try? Data(contentsOf: imageURL!)
        
        cell.myImage?.image = UIImage(data: data!)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
        
        let index = indexPath.item
        
        let imageURL = URL(string: self.items[index])
        
        let data = try? Data(contentsOf: imageURL!)
        
        closetMainImage?.image = UIImage(data: data!)
        
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.cyan
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
