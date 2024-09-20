//
//  SearchViewController.swift
//  instagram-ios
//
//  Created by TaeWook Park on 9/18/24.
//

import UIKit

class SearchViewController: UIViewController {

    
    // Collection View
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data ,Presentation , Layout
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
        
        // 네비게이션 아이템의 타이틀을 "Search"로 설정
        self.navigationItem.title = "Search"
        
        // UISearchController 인스턴스 생성 (검색 결과를 표시할 컨트롤러는 없음)
        let searchController = UISearchController(searchResultsController: nil)
        
        // 검색 중에 네비게이션 바를 숨기지 않도록 설정
        searchController.hidesNavigationBarDuringPresentation = false
        
        // 검색 바의 플레이스홀더 텍스트를 "Search"로 설정
        searchController.searchBar.placeholder = "Search"
        
        // UISearchResultsUpdating 프로토콜을 채택한 객체로 self를 지정
        searchController.searchResultsUpdater = self
        
        // 네비게이션 아이템에 검색 컨트롤러를 설정
        self.navigationItem.searchController = searchController
    }
}

// UICollectionView Data Source: Handling number of items and cell configuration
// 이 확장은 UICollectionViewDataSource 프로토콜을 구현하여 컬렉션 뷰의 데이터 소스를 설정합니다.
// 여기서는 섹션 내 아이템 수를 반환하고, 각 셀을 구성하는 역할을 합니다.
extension SearchViewController: UICollectionViewDataSource {
    // 섹션에 표시할 아이템의 개수를 반환하는 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 각 섹션에 24개의 아이템을 표시
        return 24
    }
    
    // 각 셀에 표시할 내용을 구성하는 메서드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 'ResultCell' 타입의 셀을 재사용 큐에서 가져옴(dequeue)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            // 셀이 없을 경우 기본 UICollectionViewCell 반환
            return UICollectionViewCell()
        }
        // 아이템의 번호에 맞는 이미지 이름을 설정(0부터 시작해서 +1)
        let imageName = "animal\(indexPath.item + 1)"
        // 셀을 이미지 이름으로 구성
        cell.configure(imageName)
        return cell
    }
}

// Collection View의 레이아웃을 관리하는 Delegate
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    // 각 아이템의 크기를 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1 // 아이템 간의 간격
        // 세 개의 열을 만들기 위해 각 셀의 너비를 계산
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width // 셀의 높이를 너비와 동일하게 설정 (정사각형)
        return CGSize(width: width, height: height)
    }
    
    // 섹션의 줄 간격을 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 각 줄 사이의 간격을 1로 설정
        return 1
    }
    
    // 아이템 간의 최소 간격을 설정하는 메서드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // 각 아이템 사이의 간격을 1로 설정
        return 1
    }
}


// UISearchResultsUpdating 프로토콜 구현
extension SearchViewController: UISearchResultsUpdating {
    // 검색 결과가 업데이트될 때마다 호출되는 메서드
    func updateSearchResults(for searchController: UISearchController) {
        // 검색 바의 현재 텍스트를 가져옴
        let search = searchController.searchBar.text
        // 현재 검색 텍스트를 출력
        print("Search: \(search)")
    }
}

