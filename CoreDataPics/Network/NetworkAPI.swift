//
//  NetworkMgr.swift
//  CoreDataPics
//
//  Created by Mirko Justiniano on 8/13/20.
//  Copyright © 2020 idevcode. All rights reserved.
//

import Foundation
import UIKit

struct NetworkAPI {
    static let shared = NetworkAPI()
    
    private var downloadTask: URLSessionDataTask?
    
    func fetchImages(completion: @escaping ([PhotoModel]) -> ()) {
        let accessToken = ""
        let urlString = "https://pixabay.com/api/?key=\(accessToken)&per_page=200"
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("error: \(error.localizedDescription)")
                completion([])
            } else {
                guard let data = data, let _ = String(data: data, encoding: .utf8) else {
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let hits = try decoder.decode(HitsModel.self, from: data)
                    completion(hits.hits)
                } catch {
                    debugPrint("Error decoding photo model")
                    return
                }
            }
        }
        task.resume()
    }
    
    func downloadImage(_ imageUrl: String, completion: @escaping (UIImage) -> ()) {
        let url = URL(string: imageUrl)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return
            } else {
                guard let image = UIImage(data: data!) else {
                  return
                }
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
        task.resume()
    }
    
    mutating func downloadImageCancellable(_ imageUrl: String, completion: @escaping (UIImage) -> ()) {
        let url = URL(string: imageUrl)!
        downloadTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let networkData = data else { return }
            guard let image = UIImage(data: networkData) else { return }
            DispatchQueue.main.async {
                completion(image)
            }
        }
        downloadTask?.resume()
    }
    
    mutating func cancelImageDownload() {
        if let task = downloadTask {
            task.cancel()
        }
    }
}
