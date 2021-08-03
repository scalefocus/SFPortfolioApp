//
//  UITagLabel.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 15.07.21.
//

import UIKit

@IBDesignable class UITagLabel: UILabel {
    
    // MARK: - Properties
    /// Distance between left border and text.
    @IBInspectable var paddingLeft: CGFloat {
        get {
            return textEdgeInsets.left
        }
        set {
            textEdgeInsets.left = newValue
        }
    }
    
    /// Distance between right border and text.
    @IBInspectable var paddingRight: CGFloat {
        get {
            return textEdgeInsets.right
        }
        set {
            textEdgeInsets.right = newValue
        }
    }
    
    /// Distance between top border and text.
    @IBInspectable var paddingTop: CGFloat {
        get {
            return textEdgeInsets.top
        }
        set {
            textEdgeInsets.top = newValue
        }
    }
    
    /// Distance between bottom border and text.
    @IBInspectable var paddingBottom: CGFloat {
        get {
            return textEdgeInsets.bottom
        }
        set {
            textEdgeInsets.bottom = newValue
        }
    }
    
    private var textEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    // MARK: - Public Functions
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textEdgeInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textEdgeInsets.top,
                                          left: -textEdgeInsets.left,
                                          bottom: -textEdgeInsets.bottom,
                                          right: -textEdgeInsets.right)
        return textRect.inset(by: invertedInsets)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textEdgeInsets))
    }
    
}
