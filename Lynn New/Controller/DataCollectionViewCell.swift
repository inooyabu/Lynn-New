//
//  DataCollectionViewCell.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 24/07/21.
//

import UIKit

class DataCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(item: UIImage){
        backgroundImage.image = item
    }
    
}
