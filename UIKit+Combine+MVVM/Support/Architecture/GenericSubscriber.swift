//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import Combine

public struct GenericSubscriber<Value>: Subscriber {
    
    public var combineIdentifier = CombineIdentifier()
    private let _subscribing: (Value) -> Void
    
    public init<Target: AnyObject>(_ target: Target, subscribing: @escaping (Target, Value) -> Void) {
        weak var weakTarget = target
        
        self._subscribing = { value in
            if let target = weakTarget {
                subscribing(target, value)
            }
        }
    }
    
    public func receive(subscription: Subscription) {
        subscription.request(.max(1))
    }
    
    public func receive(completion: Subscribers.Completion<Never>) {
        
    }
    
    public func receive(_ input: Value) -> Subscribers.Demand {
        _subscribing(input)
        return .unlimited
    }
}
