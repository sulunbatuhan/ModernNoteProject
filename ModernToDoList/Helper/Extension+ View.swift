//
//  Extension+ View.swift
//  ModernToDoList
//
//  Created by batuhan on 20.02.2023.
//

import Foundation
import UIKit
import JGProgressHUD

extension UIView{
    func anchor(top: NSLayoutYAxisAnchor?,
                bottom : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                trailing : NSLayoutXAxisAnchor?,
                paddingTop : CGFloat,
                paddingBottom : CGFloat,
                paddingLeft : CGFloat,
                paddingRight : CGFloat,
                width : CGFloat,
                height : CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            self.topAnchor.constraint(equalTo: top,constant: paddingTop).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
            
        }
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo:trailing,constant: paddingRight ).isActive = true
        }
        if  width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
            
        }
        if  height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func showHud(message:String,view:UIView){
        let hud = JGProgressHUD(style: .light)
        hud.textLabel.text = message
        hud.show(in:view)
        hud.dismiss(afterDelay: 1, animated: true)
    }
   
    
}
