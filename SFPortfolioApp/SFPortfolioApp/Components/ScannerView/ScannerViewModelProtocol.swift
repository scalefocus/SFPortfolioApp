//
//  ScannerViewModelProtocol.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 27.10.21.
//

import SFBaseKit

protocol ScannerViewModelProtocol: CoordinatableViewModel {
    
    /// Observable information text.
    var infoText: Observable<String> { get }
    
    /// Indicates if is able to create a snapshot.
    var shouldSnapshot: Bool { get set }
    
    /// Starts snapshotting periodically.
    func start()
    
    /// Stops snapshotting.
    func stop()
    
    /// Receives image from scanning.
    /// - Parameter image: Snapshotted image.
    func didFinishScan(_ image: UIImage)
    
    /// Changes scanned content.
    /// - Parameter type: Type of scanned content.
    func changeType(_ type: ScanType)
    
}
