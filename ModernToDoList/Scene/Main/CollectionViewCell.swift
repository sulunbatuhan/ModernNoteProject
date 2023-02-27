//
//  CollectionViewCell.swift
//  ModernToDoList
//
//  Created by batuhan on 20.02.2023.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    var selectedRow : DoList? {
        didSet{
            self.titleHeader.text = selectedRow?.title
            self.content.text = selectedRow?.content
            self.backgroundColor = UIColor(named: selectedRow!.color ?? "cell1" )
        }
    }
    
    private let titleHeader : UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 24)
        return title
    }()
    
    private let content : UILabel = {
        let lbl = UILabel()
        lbl.layer.borderWidth = 1
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.numberOfLines = 3
        return lbl
    }()
    
    private let threePoints : UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "paperclip.circle.fill"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func btnClicked(){
        let action = UIAction(title :"delete",image: UIImage(systemName: "trash")) { action in
            context.delete(self.selectedRow!)
           
            do{
                try context.save()
            }catch{
                print("silinemedi")
            }
        }
        
        let menu = UIMenu(children: [action])
        threePoints.menu = menu
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleHeader)
        addSubview(threePoints)
        //addSubview(content)
        titleHeader.anchor(top: topAnchor, bottom: nil, leading: leadingAnchor, trailing: threePoints.leadingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 12, paddingRight: -30, width: 0, height: 40)
        threePoints.anchor(top: topAnchor, bottom: nil, leading: nil, trailing: trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 0, paddingRight: -10, width: 40, height: 40)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
