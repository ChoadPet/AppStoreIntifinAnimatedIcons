//
//  DummyCollectionViewCell.swift
//  AppStore
//
//  Created by Vetaliy Poltavets on 12/28/19.
//  Copyright © 2019 vpoltave. All rights reserved.
//

import UIKit

class DummyCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor.randomColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let roundPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 35)
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        contentView.layer.mask = maskLayer
    }
}

private extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

private extension UIColor {
    static var randomColor: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}
