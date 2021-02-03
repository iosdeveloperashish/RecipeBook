//
//  ReceipeTypeViewModel.swift
//  RecipeBook
//
//  Created by Ashish Viltoriya on 31/01/21.
//

import UIKit

class ReceipeTypeViewModel {
    let screenTitle = "Receipe Type"
    let cellName = "LabelWithLeftImageTVCell"
    var receipeTypeList: [ReceipeTypeDataModel] = []
    
    func cellForRowAtIndexPath(for tableView: UITableView, in index: IndexPath) -> LabelWithLeftImageTVCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName, for: index) as! LabelWithLeftImageTVCell
        cell.loadData(data: self.receipeTypeList[index.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func fetchReceipeType() {
        do {
            guard let result = try PersistantStorage.shared.context.fetch(ReceipeType.fetchRequest()) as? [ReceipeType] else { return }
            result.forEach({ [weak self] data in
                let receipeData = ReceipeTypeDataModel(imageName: data.receipeType_ImageName ?? "",                                     receipeType: "\(data.receipeType_Name ?? "") Receipe",
                                                  receipeTypeId: Int(data.receipeType_ID))
                self?.receipeTypeList.append(receipeData)
            })
        } catch let error {
            debugPrint(error)
        }
        
        
    }
    
}
