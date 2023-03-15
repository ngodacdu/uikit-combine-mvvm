//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

protocol GatewaysAssembler {
    func resolve() -> RepoGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {

    func resolve() -> RepoGatewayType {
        RepoGateway()
    }
}

extension GatewaysAssembler where Self: PreviewAssembler {
    
    func resolve() -> RepoGatewayType {
        RepoGateway()
    }
}
