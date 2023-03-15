//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import Combine

protocol GettingRepos {
    var repoGateway: RepoGatewayType { get }
}

extension GettingRepos {
    func getRepos(dto: GetPageDto) -> Observable<PagingInfo<Repo>> {
        repoGateway.getRepos(dto: dto)
    }
}
