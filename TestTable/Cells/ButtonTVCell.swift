//
//  ButtonTVCell.swift
//  TestTable
//
//  Created by Alex Gabets on 12/13/21.
//

import UIKit

class ButtonTVCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tappedExit(_ sender: UIButton) {
        UIControl().sendAction(#selector(NSXPCConnection.suspend),
                               to: UIApplication.shared, for: nil)
    }
    
}
