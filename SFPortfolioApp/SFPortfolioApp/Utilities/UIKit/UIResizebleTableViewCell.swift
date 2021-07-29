//
//  UIResizebleTableViewCell.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 26.07.21.
//

import UIKit

class UIResizebleTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    /// Distance between left border of the table view and cell in portrait.
    @IBInspectable var leftInsetInPortrait: CGFloat {
        get {
            return frameInsetsInPortrait.left
        }
        set {
            frameInsetsInPortrait.left = newValue
        }
    }
    /// Distance between right border of the table view and cell in portrait.
    @IBInspectable var rightInsetInPortrait: CGFloat {
        get {
            return frameInsetsInPortrait.right
        }
        set {
            frameInsetsInPortrait.right = newValue
        }
    }
    /// Distance between left border of the table view and cell in landscape.
    @IBInspectable var leftInsetInLandscape: CGFloat {
        get {
            return frameInsetsInLandscape.left
        }
        set {
            frameInsetsInLandscape.left = newValue
        }
    }
    /// Distance between right border of the table view and cell in landscape.
    @IBInspectable var rightInsetInLandscape: CGFloat {
        get {
            return frameInsetsInLandscape.right
        }
        set {
            frameInsetsInLandscape.right = newValue
        }
    }
    /// Default edge insets of table view cells when device is in portrait orientation.
    private var frameInsetsInPortrait: UIEdgeInsets = UIEdgeInsets.zero
    /// Default edge insets of table view cells when device is in landscape orientation.
    private var frameInsetsInLandscape: UIEdgeInsets = UIEdgeInsets.zero
    
    // MARK: - Public Functions
    override func layoutSubviews() {
        super.layoutSubviews()
        let edgeInsets = UIDevice.current.orientation.isLandscape
        ? frameInsetsInLandscape
        : frameInsetsInPortrait
        contentView.frame = contentView.frame.inset(by: edgeInsets)
    }
    
}
