//
//  Header.swift
//  ModernToDoList
//
//  Created by batuhan on 20.02.2023.
//

import UIKit

class Header: UICollectionReusableView {
    
    let welcome : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.numberOfLines = 0
        lbl.textColor = UIColor.white
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(welcome)
        UserFirestore().getUser { user in
            self.welcome.text = "Hoşgeldin\n\(user.username)"
        }
        
        
        welcome.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 12, paddingBottom: 0, paddingLeft: 12, paddingRight: -12, width: 0, height: 130)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
