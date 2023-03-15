//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

protocol ReposUseCaseType {
    func getRepos(page: Int) -> Observable<PagingInfo<Repo>>
}

struct ReposUseCase: ReposUseCaseType, GettingRepos {
    let repoGateway: RepoGatewayType
    
    func getRepos(page: Int) -> Observable<PagingInfo<Repo>> {
        let dto = GetPageDto(page: page, perPage: 10, usingCache: true)
        return getRepos(dto: dto)
    }
}
