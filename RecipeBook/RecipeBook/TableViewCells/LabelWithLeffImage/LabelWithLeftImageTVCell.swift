//
//  LabelWithLeftImageTVCell.swift
//  RecipeBook
//
//  Created by Ashish Viltoriya on 31/01/21.
//

import UIKit

class LabelWithLeftImageTVCell: UITableViewCell {

    @IBOutlet weak var receipeTypeImageView: UIImageView!
    
    @IBOutlet weak var receipeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(data: ReceipeTypeDataModel) {
        self.receipeTypeImageView.image = UIImage(named: data.imageName)
        self.receipeNameLabel.text = data.receipeType
    }
}
