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

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // if contentsize not set, scroll view will not scroll!
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    private var imageView = UIImageView() // tiny size at this moment, 0 0 0
    
    
    private var image: UIImage? {
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size // never forget setting the content size for the scroll view!
        }
        get {
            return imageView.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(imageView)
        imageURL = NSURL(string: DemoURL.Stanford)
    }

}
