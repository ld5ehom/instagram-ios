//
//  HomeViewController.swift
//  instagram-ios
//
//  Created by TaeWook Park on 9/20/24.
//

import UIKit

class HomeViewController: UIViewController {

    // Collection View 
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Data source
        collectionView.dataSource = self
        
        // Delegate
        collectionView.delegate = self
        
        // 직접 하드코딩 = Estimate size none
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    // 섹션에 표시할 아이템의 개수를 반환하는 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 각 섹션에 24개의 아이템을 표시
        return 24
    }
    
    // 각 셀에 표시할 내용을 구성하는 메서드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 'ResultCell' 타입의 셀을 재사용 큐에서 가져옴(dequeue)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as? FeedCell else {
            // 셀이 없을 경우 기본 UICollectionViewCell 반환
            return UICollectionViewCell()
        }
        // 아이템의 번호에 맞는 이미지 이름을 설정(0부터 시작해서 +1)
        let imageName = "animal\(indexPath.item + 1)"
        // 셀을 이미지 이름으로 구성 FeedCell
        cell.configure(imageName)
        return cell
    }
}

// HomeViewController에 UICollectionViewDelegateFlowLayout를 확장하여 셀 크기를 설정
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    // 각 셀의 크기를 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 컬렉션 뷰의 전체 너비를 가져와 셀의 너비로 설정
        let width = collectionView.bounds.width
        
        // 셀의 높이를 너비의 3/4로 설정하고, 여기에 추가 60포인트를 더함 (예: 이미지 비율과 텍스트 영역 포함)
        let height = width * 3/4 + 60
        
        // 셀의 크기를 CGSize로 반환
        return CGSize(width: width, height: height)
    }
}

