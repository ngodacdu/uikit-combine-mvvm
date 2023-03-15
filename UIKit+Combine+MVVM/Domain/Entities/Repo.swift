//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import Then

struct Repo {
    var id: Int?
    var name: String?
    var fullname: String?
    var urlString: String?
    var starCount: Int?
    var folkCount: Int?
    var owner: Owner?
    
    struct Owner: Decodable {
        var avatarUrl: String?
        
        private enum CodingKeys: String, CodingKey {
            case avatarUrl = "avatar_url"
        }
    }
}

extension Repo: Then, Equatable {
    static func == (lhs: Repo, rhs: Repo) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Repo: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, name
        case fullname = "full_name"
        case urlString = "html_url"
        case starCount = "stargazers_count"
        case folkCount = "forks"
        case owner
    }
}
