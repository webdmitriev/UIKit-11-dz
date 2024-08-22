//
//  ViewController.swift
//  UIKit - 11 - dz
//
//  Created by Олег Дмитриев on 22.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let newsData = NewsData.mockData()
    
    
    // MARK: - collectionView
    private lazy var collectionView: UICollectionView = {
        
        var layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        
        $0.dataSource = self
        $0.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseID)
        $0.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        title = "News posts"
        
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseID, for: indexPath) as! PostCell
        
        let item = newsData[indexPath.item]
        
        cell.setupCell(item: item)
        
        cell.backgroundColor = .appGray
        
        return cell
    }
    
    
}
