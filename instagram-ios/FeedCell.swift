//
//  FeedCell.swift
//  instagram-ios
//
//  Created by TaeWook Park on 9/20/24.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // Image View 
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // 셀이 재사용되기 전에 호출되는 메서드
    // 여기서는 이미지뷰의 이미지를 초기화하여 이전에 사용된 이미지가 남지 않도록 함
    override func prepareForReuse() {
        super.prepareForReuse()
        // 재사용 시 이미지뷰의 이미지를 nil로 설정
        thumbnailImageView.image = nil
    }
    
    // 셀을 구성하는 메서드
    // 이미지 이름을 받아서 해당 이미지를 이미지뷰에 설정함
    func configure(_ imageName: String) {
        // 전달된 이미지 이름에 맞는 이미지를 설정
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
