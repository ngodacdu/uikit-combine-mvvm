//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import UIKit

protocol ReposNavigatorType {
    func toRepoDetail(repo: Repo)
}

struct ReposNavigator: ReposNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toRepoDetail(repo: Repo) {
        
    }
}
