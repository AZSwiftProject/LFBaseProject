//
//  ColletionViewController1.swift
//  LFBaseProject
//
//  Created by admin on 2022/9/30.
//

import UIKit
// 瀑布流
class ColletionViewController1: UIViewController {
    private let cellID = "baseCellID"
    var itemCount: Int = 30
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpView()
        foo()
    }
        
        
       
    func setUpView() {
        // 设置 flowlayout
        let layout = LFWaterFallFlowLayout()
        layout.delegate = self
        
        // 设置 collectionview
        let  margin: CGFloat = 8
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = margin
        layout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        // 注册 Cell
        collectionView.register(BaseCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        view.addSubview(collectionView)
    }
}

extension ColletionViewController1: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BaseCollectionViewCell
        cell.cellIndex = indexPath.item
        cell.backgroundColor = indexPath.item % 2 == 0 ? .systemBlue : .purple
        if itemCount - 1 == indexPath.item {
            itemCount += 20
            collectionView.reloadData()
        }
        return cell
    }
}

extension ColletionViewController1: LFWaterFallFlowLayoutDelegate{
    func waterFlowLayout(_ waterFlowLayout: LFWaterFallFlowLayout, itemHeight indexPath: IndexPath) -> CGFloat {
        return CGFloat(arc4random_uniform(150) + 50)
    }
}
