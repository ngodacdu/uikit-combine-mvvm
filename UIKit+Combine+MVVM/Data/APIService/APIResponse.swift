//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

public struct APIResponse<T> {
    public var header: ResponseHeader?
    public var data: T
    
    public init(header: ResponseHeader?, data: T) {
        self.header = header
        self.data = data
    }
}
