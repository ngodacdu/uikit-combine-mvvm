//
//  Created by Ngo Dac Du on 29.12.17.
//  Copyright © 2022 Ngo Dac Du. All rights reserved.
//

import UIKit
import Reusable
import Combine
import SDWebImage

final class ReposViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: ReposViewModel!
    var cancelBag = CancelBag()
    
    private let loadRepoTrigger = PassthroughSubject<Void, Never>()
    private let reloadRepoTrigger = PassthroughSubject<Void, Never>()
    private let loadMoreRepoTrigger = PassthroughSubject<Void, Never>()
    private let selectRepoTrigger = PassthroughSubject<IndexPath, Never>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        title = "Repo List"
    }
    
    func bindViewModel() {
        let input = ReposViewModel.Input(
            loadTrigger: Driver.just(()),
            reloadTrigger: reloadRepoTrigger.asDriver(),
            loadMoreTrigger: loadMoreRepoTrigger.asDriver(),
            selectRepoTrigger: selectRepoTrigger.asDriver()
        )
        
        let output = viewModel.transform(input, cancelBag: cancelBag)
        
        output.$repos
            .sink(receiveValue: { [unowned self] repos in
                
            })
            .store(in: cancelBag)
        
        output.$alert.subscribe(alertSubscriber)
        output.$isLoading.subscribe(loadingSubscriber)
    }
}

// MARK: - Subscribers
extension ReposViewController {
    
}

// MARK: - StoryboardSceneBased
extension ReposViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.repo
}
