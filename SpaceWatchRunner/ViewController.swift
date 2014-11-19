//
//  ViewController.swift
//  SpaceWatchRunner
//
//  Created by Charlie Elliott on 11/18/14.
//  Copyright (c) 2014 charlieelliott. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("animatedImageViewCell", forIndexPath: indexPath) as UICollectionViewCell
        
        if let animatedCell = cell as? AnimatedIconCollectionViewCell {
            animatedCell.updateImageViewWithPlayerName("p\(indexPath.row + 1)")
        }
        return cell
    }
}

