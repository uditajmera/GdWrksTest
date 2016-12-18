//
//  StoreCollectionViewCell.swift
//  GdWrksTest
//
//  Created by Udit Ajmera on 12/17/16.
//  Copyright © 2016 Udit Ajmera. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var objPic: UIImageView!

    @IBOutlet weak var objAddress: UILabel!
    
    @IBOutlet weak var objName: UILabel!
    
    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    public func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.objPic.image = UIImage(data: data)
            }
        }
    }

    
}
