//
//  customUIExtensions.swift
//  testingAlamoFire
//
//  Created by ThuRein Tun on 9/28/16.
//  Copyright © 2016 ThuRein Tun. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func showImageByUrl(urlBaseString: String) -> UIImage {
        let imgUrl : URL = URL(string: urlBaseString)!
        let imgData : Data
        do {
            imgData = try Data(contentsOf: imgUrl)
            let imgReturn : UIImage = UIImage(data: imgData)!
            return imgReturn
        }catch let error as NSError{
            print(error.localizedDescription);
        }
        return UIImage(named: "error")!
    }
}
extension UILabel {
    override open func awakeFromNib() {
        self.sizeToFit()
    }
}
