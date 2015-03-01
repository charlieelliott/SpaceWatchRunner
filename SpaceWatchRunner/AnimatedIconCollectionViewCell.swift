//
//  AnimatedIconCollectionViewCell.swift
//  SpaceWatchRunner
//
//  Created by Charlie Elliott on 11/18/14.
//  Copyright (c) 2014 charlieelliott. All rights reserved.
//

import UIKit

class AnimatedIconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animatedImageView: UIImageView!
    
    override func prepareForReuse() {
        animatedImageView.stopAnimating()
    }
    
    func updateImageViewWithPlayerName(name: String) {
        
        var temp = NSMutableArray()
        for var i = 1; i < 12; i++ {
            var name = "\(name)_walk\(i)"
            if let image = UIImage(named: name) {
                temp.addObject(image)
            }
        }
        
        animatedImageView.animationImages = temp as [AnyObject]
        
        animatedImageView.animationDuration = (11.0 / 30.0) //30 fps
        animatedImageView.startAnimating()
    }
}