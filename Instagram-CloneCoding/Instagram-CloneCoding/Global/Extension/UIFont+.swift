//
//  UIFont+.swift
//  Instagram-CloneCoding
//
//  Created by EUNJU on 2022/04/21.
//

import UIKit

enum FontWeight {
    case bold, semiBold, regular, medium
}

extension UIFont {
    
    // MARK: SF-Pro-Text Font
    class func SFProTextB(size: CGFloat) -> UIFont! {
        return UIFont(name: "SFProText-Bold", size: size)
    }
    
    class func SFProTextSB(size: CGFloat) -> UIFont! {
        return UIFont(name: "SFProText-Semibold", size: size)
    }
    
    class func SFProTextR(size: CGFloat) -> UIFont! {
        return UIFont(name: "SFProText-Regular", size: size)
    }
    
    class func SFProTextM(size: CGFloat) -> UIFont! {
        return UIFont(name: "SFProText-Medium", size: size)
    }
}
