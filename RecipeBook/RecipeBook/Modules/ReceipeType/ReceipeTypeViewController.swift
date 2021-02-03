//
//  ReceipeTypeViewController.swift
//  RecipeBook
//
//  Created by Ashish Viltoriya on 31/01/21.
//

import UIKit
import CoreData

class ReceipeTypeViewController: UIViewController {

    let viewModel: ReceipeTypeViewModel = ReceipeTypeViewModel()
    
    @IBOutlet weak var receipeTypeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.screenTitle
        self.receipeTypeTableView.register(UINib(nibName: viewModel.cellName, bundle: nil), forCellReuseIdentifier: viewModel.cellName)
        self.viewModel.fetchReceipeType()
    }
    
    deinit {
        print(self.title, "deinit called")
    }
    
}
/*
    MARK:- Table View Methods
 */
extension ReceipeTypeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.receipeTypeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewModel.cellForRowAtIndexPath(for: tableView, in: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "ReceipeListViewController") as! ReceipeListViewController
        viewController.viewModel = ReceipeListViewModel()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}



