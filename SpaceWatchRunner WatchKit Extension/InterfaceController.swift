//
//  InterfaceController.swift
//  SpaceWatchRunner WatchKit Extension
//
//  Created by Charlie Elliott on 11/18/14.
//  Copyright (c) 2014 charlieelliott. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var playerImageView: WKInterfaceImage!
    
    @IBOutlet weak var pButtonGroup: WKInterfaceGroup!
    
    @IBOutlet weak var p1Button: WKInterfaceButton!
    @IBOutlet weak var p2Button: WKInterfaceButton!
    @IBOutlet weak var p3Button: WKInterfaceButton!
    
    //Lifecycle
    
    init(context: AnyObject?) {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
        NSLog("%@ init", self)
        
        self.preCacheImages()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        NSLog("%@ will activate", self)
        super.willActivate()
        
        // start first image 
        self.p1ButtonPressed()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
        
        self.stopAnimating();
    }
    
    //internal interface
    
    func preCacheImages() {
        //loop through the images & cache them
        for var p = 1; p <= 3; p++ {
            for var i = 0; i < 11; i++ {
                var name = "p\(p)_walk\(i)"
                if let img = UIImage(named: name) {
                    WKInterfaceDevice.currentDevice().addCachedImage(img, name: name)
                }
            }
        }
    }
    
    func stopAnimating() {
        self.playerImageView.stopAnimating()
    }
    
    func loadPlayerImageWithName(name: String) {
        self.playerImageView.setImageNamed(name)
        
        //animate all the images execpt the placeholder (0) at ~30 fps
        self.playerImageView.startAnimatingWithImagesInRange(NSMakeRange(1, 11), duration: (11 / 30), repeatCount: 0)
    }
    
    //actions
    
    @IBAction func p1ButtonPressed() {
        self.loadPlayerImageWithName("p1_walk")
    }
    
    @IBAction func p2ButtonPressed() {
        self.loadPlayerImageWithName("p2_walk")
    }
    
    @IBAction func p3ButtonPressed() {
        self.loadPlayerImageWithName("p3_walk")
    }

}
