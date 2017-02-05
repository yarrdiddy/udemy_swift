//
//  ViewController.swift
//  PageScroll
//
//  Created by David Reynolds on 1/28/17.
//  Copyright © 2017 David Reynolds. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var touchableView: UIView!
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        let scrollHeight = scrollView.frame.size.height
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            let sideLength: CGFloat = 150
            let offset = sideLength / 2
            
            imageView.frame = CGRect(x: newX - offset, y: (scrollHeight / 2) - offset, width: sideLength, height: sideLength)
            
        }
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        touchableView.addGestureRecognizer(scrollView.panGestureRecognizer)
        
    }

}

    
