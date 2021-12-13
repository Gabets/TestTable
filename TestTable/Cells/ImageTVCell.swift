//
//  ImageTVCell.swift
//  TestTable
//
//  Created by Alex Gabets on 12/13/21.
//

import Kingfisher
import UIKit

class ImageTVCell: UITableViewCell {

    @IBOutlet weak var testImageView: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(imageURL: String, text: String) {
        let url = URL(string: imageURL)
        testImageView.kf.setImage(with: url)
        
        testLabel.text = text
    }
    
    func setupNumberOfLines(_ number: Int) {
        testLabel.numberOfLines = number
    }

}
