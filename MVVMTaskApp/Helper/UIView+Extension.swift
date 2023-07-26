//
//  UIView+Extension.swift
//  MVVMTaskApp
//
//  Created by CV on 6/4/21.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {
    @IBInspectable
    override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
           get { return layer.shadowRadius }
           set { layer.shadowRadius = newValue }
       }

       @IBInspectable
    var shadowOpacity: CGFloat {
           get { return CGFloat(layer.shadowOpacity) }
           set { layer.shadowOpacity = Float(newValue) }
       }

       @IBInspectable
    var shadowOffset: CGSize {
           get { return layer.shadowOffset }
           set { layer.shadowOffset = newValue }
       }

    @IBInspectable
    var shadowColor: UIColor? {
            get {
                guard let cgColor = layer.shadowColor else {
                    return nil
                }
                return UIColor(cgColor: cgColor)
            }
            set { layer.shadowColor = newValue?.cgColor }
        }
}
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
}


@IBDesignable
class DesignableButton: UIButton {
    @IBInspectable
    override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
           get { return layer.shadowRadius }
           set { layer.shadowRadius = newValue }
       }

       @IBInspectable
    var shadowOpacity: CGFloat {
           get { return CGFloat(layer.shadowOpacity) }
           set { layer.shadowOpacity = Float(newValue) }
       }

       @IBInspectable
    var shadowOffset: CGSize {
           get { return layer.shadowOffset }
           set { layer.shadowOffset = newValue }
       }

    @IBInspectable
    var shadowColor: UIColor? {
            get {
                guard let cgColor = layer.shadowColor else {
                    return nil
                }
                return UIColor(cgColor: cgColor)
            }
            set { layer.shadowColor = newValue?.cgColor }
        }
}

@IBDesignable
class DesignableImage: UIImageView {
    @IBInspectable
    override var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    override var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
           get { return layer.shadowRadius }
           set { layer.shadowRadius = newValue }
       }

       @IBInspectable
    var shadowOpacity: CGFloat {
           get { return CGFloat(layer.shadowOpacity) }
           set { layer.shadowOpacity = Float(newValue) }
       }

       @IBInspectable
    var shadowOffset: CGSize {
           get { return layer.shadowOffset }
           set { layer.shadowOffset = newValue }
       }

    @IBInspectable
    var shadowColor: UIColor? {
            get {
                guard let cgColor = layer.shadowColor else {
                    return nil
                }
                return UIColor(cgColor: cgColor)
            }
            set { layer.shadowColor = newValue?.cgColor }
        }
}
