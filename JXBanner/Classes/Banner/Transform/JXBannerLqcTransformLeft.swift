//
//  JXBannerLqcTransformLeft.swift
//  JXBanner
//
//  Created by mac on 2020/10/14.
//

import UIKit

public struct JXBannerLqcTransformLeft: JXBannerTransformable {
    
    let left: CGFloat
    
    public init(left: CGFloat) {
        self.left = left
    }
    
    public func transformToAttributes(collectionView: UICollectionView,
                               params: JXBannerLayoutParams,
                               attributes: UICollectionViewLayoutAttributes) {
        
        let collectionViewWidth = collectionView.frame.width
        if collectionViewWidth <= 0 { return }
        let centetX = collectionView.contentOffset.x + collectionViewWidth * 0.5
        let delta = abs(attributes.center.x - centetX)
//        let scale = max(1 - delta / collectionViewWidth * params.rateOfChange, params.minimumScale)
        
        
//        var transform: CGAffineTransform = CGAffineTransform(scaleX: scale, y: scale)
//        var _alpha = alpha
        
        // Adjust spacing When Scroling
        let location = JXBannerTransfrom.itemLocation(viewCentetX: centetX,
                                                      itemCenterX: attributes.center.x)
//        let rate = 1.05 + params.rateHorisonMargin
//        var translate: CGFloat = 0
//        switch location {
//        case .left:
//            translate = rate * attributes.size.width * (1 - scale) / 2
//        case .right:
//            translate = -rate * attributes.size.width * (1 - scale) / 2
//        case .center:
//            alpha = 1.0
//        }
        
        let alpha = location == .center ? 1.0 : max(1 - delta / collectionViewWidth, params.minimumAlpha)
        
//        transform = transform.translatedBy(x: translate, y: 0)
        
        // Set transform
        attributes.transform = CGAffineTransform(translationX: left, y: 0)
        attributes.alpha = alpha
    }
}
