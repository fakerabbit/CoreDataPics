//
//  Cell.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/14/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    private lazy var photoView: UIImageView! = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var label: UILabel! = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var networkAPI: NetworkAPI = {
        return NetworkAPI()
    }()
    
    var model: PhotoModel? = nil {
        didSet {
            if let thumbUrl = model?.previewURL {
                networkAPI.downloadImageCancellable(thumbUrl) { image in
                    self.photoView.image = image
                }
            }
            self.label?.text = "❤️ \(model?.likes ?? 0)"
            self.label.sizeToFit()
            self.photoView.image = nil
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(photoView)
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        photoView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        networkAPI.cancelImageDownload()
    }

}
