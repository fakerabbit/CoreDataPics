//
//  ImageView.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/14/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit

class ImageView: UIView {

    var model: PhotoModel! {
        didSet {
            NetworkAPI.shared.downloadImage(model.largeImageURL) { image in
                self.imageView.image = image
            }
        }
    }
    
    private lazy var imageView: UIImageView! = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loading: UIActivityIndicatorView! = {
        let loading = UIActivityIndicatorView(style: .large)
        loading.startAnimating()
        return loading
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        
        self.addSubview(loading)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        loading.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
