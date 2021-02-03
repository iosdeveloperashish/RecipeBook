//
//  ReceipeListViewController.swift
//  RecipeBook
//
//  Created by Ashish Viltoriya on 01/02/21.
//

import UIKit

class ReceipeListViewController: UIViewController {

    var viewModel: ReceipeListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel.screenName
    }
    
    deinit {
        print(self.title, "deinit called")
    }

}
