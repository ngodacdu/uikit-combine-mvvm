//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import Alamofire

// MARK: - GetRepoList
extension API {
    func getRepoList(_ input: GetRepoListInput) -> Observable<GetRepoListOutput> {
        return request(input)
    }
    
    final class GetRepoListInput: APIInput {
        init(dto: GetPageDto) {
            let params: Parameters = [
                "q": "language:swift",
                "per_page": dto.perPage,
                "page": dto.page
            ]
            
            super.init(urlString: API.Urls.getRepoList,
                       parameters: params,
                       method: .get,
                       requireAccessToken: true)
            
            usingCache = dto.usingCache
        }
    }
    
    final class GetRepoListOutput: Decodable {
        private(set) var repos: [Repo]?
        
        // swiftlint:disable:next nesting
        private enum CodingKeys: String, CodingKey {
            case repos = "items"
        }
    }
}
