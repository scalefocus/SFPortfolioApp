//
//  UINavigationBar+Blurred.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 23.07.21.
//

import UIKit

extension UINavigationBar {
    
    /// Аpplies a blur effect to the navigation bar.
    /// - Warning: Apply it after setting key window to take the correct value of the status bar height.
    func blurred() {
        removedBorder()
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        var blurFrame = bounds
        blurFrame.size.height += statusBarHeight
        blurFrame.origin.y -= statusBarHeight
        let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.isUserInteractionEnabled = false
        blurView.frame = blurFrame
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)
        blurView.layer.zPosition = -1
    }
    
    /// Removes border lines of the navigation bar.
    private func removedBorder() {
        shadowImage = UIImage()
        layoutIfNeeded()
    }
    
}
