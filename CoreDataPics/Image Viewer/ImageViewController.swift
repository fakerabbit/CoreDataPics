//
//  ImageViewController.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/14/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    private lazy var imageView: ImageView! = {
        return ImageView(frame: .zero)
    }()
    
    private var model: PhotoModel!
    
    init(model: PhotoModel) {
        super.init(nibName: nil, bundle: nil)
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = imageView
        imageView.model = model
    }

}
