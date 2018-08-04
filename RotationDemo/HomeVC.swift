//
//  HomeVC.swift
//  RotationDemo
//
//  Created by Abhinay on 04/08/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

class HomeVC:UIViewController
{
    fileprivate let webImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "web")
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    fileprivate let spiderImage:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "spider")
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageAppearance()
        initialSetting()
    }
    
    fileprivate func initialSetting()
    {
        navigationItem.title = "Basic Animation"
        view.addSubview(webImage)
        view.addSubview(spiderImage)
        setLayout()
        addRotationAnimation()
    }
    
    fileprivate func pageAppearance()
    {
        view.backgroundColor = .white
    }
    
    fileprivate func setLayout()
    {
        view.addConstraint(visualFormat: "H:|[v0]|", forViews: webImage)
        view.addConstraint(visualFormat: "V:|[v0]|", forViews: webImage)
        
        view.addConstraint(visualFormat: "H:[v0(200)]", forViews: spiderImage)
        view.addConstraint(visualFormat: "V:[v0(200)]", forViews: spiderImage)
        
        spiderImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spiderImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func addRotationAnimation()
    {
        let options:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: UIViewAnimationOptions.RawValue(UInt8(UIViewAnimationOptions.autoreverse.rawValue) | UInt8(UIViewAnimationOptions.curveEaseInOut.rawValue)  | UInt8(UIViewAnimationOptions.repeat.rawValue) ))

        
        UIView.animate(withDuration: 0.50, delay: 0, options: options, animations: {[weak self] in
            self?.spiderImage.transform = CGAffineTransform(rotationAngle: 0.45)
        }, completion: nil)
    }
    
    
}

extension UIView
{
    func addConstraint(visualFormat format:String, forViews: UIView...)
    {
        var dict = [String:UIView]()
        for (index, view) in forViews.enumerated()
        {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            dict[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: dict))
    }
}


