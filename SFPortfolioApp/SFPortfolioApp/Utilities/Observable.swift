//
//  Observable.swift
//  SFPortfolioApp
//
//  Created by Stoyko Kolev on 9.08.21.
//

import Foundation
import Combine

/// Class that wraps a publisher which can send to its subscribers values of any type each time they would be set.
class Observable<Value> {
    
    // MARK: - Properties
    var value: Value {
        willSet {
            onUpdatePublisher.send(value)
        }
    }
    private var cancellables: Set<AnyCancellable> = []
    private var onUpdatePublisher: CurrentValueSubject<Value, Never>
    
    // MARK: - Init
    init(_ initialValue: Value) {
        value = initialValue
        onUpdatePublisher = CurrentValueSubject<Value, Never>(value)
    }
    
    // MARK: - Public Functions
    /// Attaches a subscriber with closure-based behavior to a publisher that never fails.
    /// - Parameter queue: Queue to which the task is submitted.
    /// - Parameter receivedValue: The closure to execute on receipt of a value.
    func sink(on queue: DispatchQueue = .main, receivedValue: @escaping (Value) -> Void) {
        onUpdatePublisher
            .receive(on: queue)
            .sink(receiveValue: receivedValue)
            .store(in: &cancellables)
    }
    
}
