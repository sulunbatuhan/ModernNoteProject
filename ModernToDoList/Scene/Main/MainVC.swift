//
//  ViewController.swift
//  ModernToDoList
//
//  Created by batuhan on 16.02.2023.
//

import UIKit

protocol MainViewProtocol{
    
}

final class MainVC: UICollectionViewController ,MainViewProtocol{
   
    

    var list = [DoList]()
    var viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollection()
        navigationSettings()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
    fetchData()
        self.collectionView.reloadData()
    }
   
    
    func fetchData(){
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        do{
            let list = try context.fetch(DoList.fetchRequest())
            self.list = list
        }catch{
            print("getirilemedi")
        }
    }
    

    @objc fileprivate func person(){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let exit = UIAlertAction(title: "Oturumu Kapat", style: .destructive){_ in
            UserFirestore().singOut { Bool in
                if Bool == true {
                    self.view.showHud(message: "Çıkış yapılıyor", view: self.view)
                    self.navigationController?.popToRootViewController(animated: true)
                    return
                }else{
                    self.view.showHud(message: "Oturum kapatılamadı", view: self.view)
                }
            }}
            
            let cancel = UIAlertAction(title: "Devam et", style: .default)
            alertController.addAction(exit)
            alertController.addAction(cancel)
            present(alertController,animated: true)
        
        
    }
    @objc fileprivate func newToDo(){
        let saveVc = SaveVC()
        navigationController?.pushViewController(saveVc, animated: true)
    }
   
   


}


//MARK: UICollection Stuff
extension MainVC : UICollectionViewDelegateFlowLayout{
    
    func setCollection(){
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = list[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.selectedRow = row
        cell.layer.cornerRadius = 40
        return cell
    }
    //DIDSELECT
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DetailVC()
        detail.selectedRow = list[indexPath.row]
        navigationController?.pushViewController(detail, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath)
        return header
    }
    
}
//MARK: UI Stuff
extension MainVC {
    
    @objc func filterTapped(){
        
    }
    
    
    
    func navigationSettings(){
        
        
        let filterBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        filterBtn.setImage(UIImage(systemName: "bell"), for: .normal)
        filterBtn.tintColor = .white
        filterBtn.addTarget(self, action: #selector(filterTapped), for: .touchUpInside)
        
        let lblBadge = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: 15, height: 15))
        lblBadge.backgroundColor = .green
        lblBadge.clipsToBounds = true
        lblBadge.layer.cornerRadius = 7
        lblBadge.textColor = UIColor.white
        lblBadge.font = UIFont.systemFont(ofSize: 10)
        lblBadge.textAlignment = .center
        
        filterBtn.addSubview(lblBadge)
        
        
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .done, target: self, action: #selector(person))
        let right = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(newToDo))
        let left = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .done, target: self, action: #selector(newToDo))
        navigationItem.leftBarButtonItem?.tintColor = .white
        right.tintColor = .white
        left.tintColor = .white
        navigationItem.rightBarButtonItems = [right,UIBarButtonItem.init(customView: filterBtn)]
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


extension Notification.Name {
    static let bildirimAdi = Notification.Name("broadcast")
}

