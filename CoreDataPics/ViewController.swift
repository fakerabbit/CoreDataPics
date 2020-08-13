//
//  ViewController.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/13/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var mainView: View! = {
        return View(frame: UIScreen.main.bounds)
    }()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

