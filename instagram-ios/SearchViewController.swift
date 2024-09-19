//
//  SearchViewController.swift
//  instagram-ios
//
//  Created by TaeWook Park on 9/18/24.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

