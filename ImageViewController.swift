//
//  ImageViewController.swift
//  Cassini
//
//  Created by Panpan Lin on 01/11/2016.
//  Copyright © 2016 IBM. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageURL: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            if let imageData = NSData(contentsOf: url as URL) {
                image = UIImage(data: imageData as Data)
            }
        }
    }

    private var imageView = UIImageView() // tiny size at this moment, 0 0 0
    
    
    private var image: UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
        }
        get {
            return imageView.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        imageURL = NSURL(string: DemoURL.Stanford)
    }

}
