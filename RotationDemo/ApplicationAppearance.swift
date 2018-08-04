//
//  ApplicationAppearance.swift
//  RotationDemo
//
//  Created by Abhinay on 04/08/18.
//  Copyright © 2018 ONS. All rights reserved.
//

import UIKit

class ApplicationAppearance
{
    static func initialAppearance()
    {
        UIApplication.shared.statusBarStyle = .lightContent
        
        UINavigationBar.appearance().barTintColor = .orange
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 24.0), NSAttributedStringKey.foregroundColor:UIColor.white]
    }
}
