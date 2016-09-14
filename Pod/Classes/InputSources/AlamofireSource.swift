//
//  AlamofireSource.swift
//  Pods
//
//  Created by Petr Zvoníček on 14.01.16.
//
//

import Alamofire
import AlamofireImage

open class AlamofireSource: NSObject, InputSource {
    var url: URL!
    
    public init(url: URL) {
        self.url = url
        super.init()
    }

    public init?(urlString: String) {
        if let validUrl = URL(string: urlString) {
            self.url = validUrl
            super.init()
        } else {
            super.init()
            return nil
        }
    }
    
    open func setToImageView(_ imageView: UIImageView) {
        Alamofire.request(self.url, method: .get)
            .responseImage { response in
                if let image = response.result.value {
                    imageView.image = image
                }
        }
    }
    
}
