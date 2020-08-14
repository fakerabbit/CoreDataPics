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
        let view = View(frame: UIScreen.main.bounds)
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "CoreData Pics"
        CoreDataAPI.shared.fetchImages() { images in
            self.mainView.dataProvider = images
        }
    }
}

extension ViewController {
    
    func imageSelected(_ model: PhotoModel?) {
        if let photoModel = model {
            let imageController = ImageViewController(model: photoModel)
            self.navigationController?.pushViewController(imageController, animated: true)
        }
    }
}

