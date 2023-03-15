//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import Foundation

struct RepoItemViewModel {
    let repo: Repo
    let name: String
    let url: URL?
    
    init(repo: Repo) {
        self.repo = repo
        name = repo.name ?? ""
        url = URL(string: repo.owner?.avatarUrl ?? "")
    }
}
