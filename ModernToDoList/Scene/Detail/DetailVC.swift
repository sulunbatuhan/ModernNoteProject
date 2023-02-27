//
//  DetailVC.swift
//  ModernToDoList
//
//  Created by batuhan on 20.02.2023.
//

import UIKit

protocol DetailProtocol{
    func interfaceSettings()
    func layoutSettings()
}

final class DetailVC: UIViewController {

    var selectedRow : DoList?{
        didSet{
            self.titleText.text = selectedRow?.title
            self.contentText.text = selectedRow?.content
            self.view.backgroundColor = UIColor(named: (selectedRow?.color)!)
        }
    }
    
    private let titleText : UILabel = {
        let lbl = UILabel()
        lbl.text = "Grocery Shopping"
        lbl.font = UIFont.boldSystemFont(ofSize: 50)
        lbl.tintColor = .black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let contentText : UITextView = {
        let lbl = UITextView()
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        lbl.textAlignment = .left
        lbl.backgroundColor = .none
        lbl.tintColor = .black
        return lbl
    }()
    
    
    lazy var viewModel = DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        interfaceSettings()
        setPopUpButton()
        
    }
    
    override func viewDidLayoutSubviews() {
        detailAddSubView()
        layoutSettings()
    }
    

    @objc private func back(){
        navigationController?.popViewController(animated: true)
    }
    
    private func setPopUpButton(){
        let actionEdit = UIAction(title:"Edit",image: UIImage(systemName: "pencil")) { [weak self]action in
            if  let content = self!.contentText.text{
                self!.viewModel.edit(row: self!.selectedRow!, content: content)}
            self?.navigationController?.popViewController(animated: true)
        }
        let deleteAction = UIAction(title:"Delete",image: UIImage(systemName: "trash")) { delete in
            let alertController = UIAlertController(title:nil, message: nil, preferredStyle: .actionSheet)
            let delete = UIAlertAction(title: "Sil", style: .destructive){_ in
                self.viewModel.delete(row: self.selectedRow!)
                self.navigationController?.popViewController(animated: true)
            }
            let cancel = UIAlertAction(title: "İptal et", style: .default)
            alertController.addAction(delete)
            alertController.addAction(cancel)
            self.present(alertController, animated: true)
        }
        let menu = UIMenu(children: [actionEdit,deleteAction])
        self.navigationItem.rightBarButtonItem  = UIBarButtonItem(image:UIImage(systemName: "ellipsis.circle.fill"), menu: menu)
        self.navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
}

extension DetailVC:DetailProtocol{
    func interfaceSettings(){
        view.backgroundColor = .systemYellow
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    private func detailAddSubView(){
        view.addSubview(titleText)
        view.addSubview(contentText)
    }
    
   func layoutSettings(){
        titleText.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 10, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 200)
        contentText.anchor(top: titleText.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 10, paddingBottom: -30, paddingLeft: 30, paddingRight: -30, width: 0, height: 0)
    }
}
