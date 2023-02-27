//
//  SaveVC.swift
//  ModernToDoList
//
//  Created by batuhan on 20.02.2023.
//

import UIKit
import CoreData

protocol SaveViewProtocol{
    
}

final class SaveVC: UIViewController ,SaveViewProtocol{
    
    
    let colorButton1 : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(named: "cell1")
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return btn
    }()
    let colorButton2 : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(named: "cell2")
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return btn
    }()
    let colorButton3 : UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = UIColor(named: "cell3")
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        return btn
    }()
    
    let titleView : UITextField = {
        let txt = UITextField()
        txt.borderStyle = .none
        txt.placeholder = "Todo List"
        txt.font = UIFont.boldSystemFont(ofSize: 18)
        txt.textColor = .white
        return txt
    }()
    
    let txtView : UITextView = {
        let txt = UITextView()
        txt.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        txt.backgroundColor = .none
        txt.textColor = .white
        return txt
    }()
    
   lazy var viewModel = SaveViewModel()
    
    var selectedColor  : String = "cell1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "cell1")
        interfaceSettings()
        
    }
    
    
    @objc fileprivate func changeView(sender:UIButton){
        
        switch (sender) {
        case colorButton1 :
            colorButton1.backgroundColor = .white
            view.backgroundColor = UIColor(named: "cell1")
            selectedColor = "cell1"
            navigationItem.rightBarButtonItem?.tintColor = .black
            colorButton2.backgroundColor = UIColor(named: "cell2")
            colorButton3.backgroundColor = UIColor(named: "cell3")
            navigationItem.leftBarButtonItem?.tintColor = .black
            titleView.textColor = .black
            txtView.textColor = .black
            break
        case colorButton2:
            colorButton1.backgroundColor = UIColor(named: "cell1")
            colorButton3.backgroundColor = UIColor(named: "cell3")
            colorButton2.backgroundColor = .white
            view.backgroundColor = UIColor(named: "cell2")
            navigationItem.rightBarButtonItem?.tintColor = .black
            navigationItem.leftBarButtonItem?.tintColor = .black
            selectedColor = "cell2"
            titleView.textColor = .black
            txtView.textColor = .black
            break
        case colorButton3:
            colorButton1.backgroundColor = UIColor(named: "cell1")
            colorButton2.backgroundColor = UIColor(named: "cell2")
            colorButton3.backgroundColor = .white
            view.backgroundColor = UIColor(named: "cell3")
            navigationItem.rightBarButtonItem?.tintColor = .black
            navigationItem.leftBarButtonItem?.tintColor = .black
            selectedColor = "cell3"
            titleView.textColor = .black
            txtView.textColor = .black
            break
        default:
            view.backgroundColor = .white
            selectedColor = "cell1"
        }
    }
    
    @objc fileprivate func back(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func save(){
        //guard let header = self.titleView.text,!header.isEmpty else {return}
        
        guard let icerik = self.txtView.text,!icerik.isEmpty else {return}
        if let header = self.titleView.text,header.count > 1{
            viewModel.save(title: header, content: icerik, color: selectedColor )
        }
        
     
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        view.addSubview(colorButton1)
        view.addSubview(colorButton2)
        view.addSubview(colorButton3)
        
       
        let stackView = UIStackView(arrangedSubviews: [colorButton1,colorButton2,colorButton3])
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 30, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 76, height: 20)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.axis = .horizontal
        stackView.layer.cornerRadius = 10

       
        view.addSubview(titleView)
        view.addSubview(txtView)
        
        colorButton1.anchor(top: nil, bottom: nil, leading: stackView.leadingAnchor, trailing: colorButton2.leadingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: -8, width: 20, height: 20)
        colorButton1.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        colorButton2.anchor(top: nil, bottom: nil, leading: colorButton1.trailingAnchor, trailing: colorButton3.leadingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: -8, width: 20, height: 20)
        colorButton2.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        colorButton3.anchor(top: nil, bottom: nil, leading: colorButton2.trailingAnchor, trailing: stackView.trailingAnchor ,paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 8, width: 20, height: 20)
        colorButton3.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        titleView.anchor(top: stackView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 24, paddingBottom: 0, paddingLeft: 30, paddingRight: 30, width: 0, height: 40)
        txtView.anchor(top: titleView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 30, paddingBottom: -30, paddingLeft: 30, paddingRight: -30, width: 0, height: 0)
       
    }
}

extension SaveVC {
    func interfaceSettings(){
        navigationItem.title = "JustDo"
        navigationController?.navigationBar.tintColor = .white

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(back))
  

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(save))
        
        navigationItem.rightBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.tintColor = .black
       
    }
}
