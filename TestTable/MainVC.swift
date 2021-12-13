//
//  ViewController.swift
//  TestTable
//
//  Created by Alex Gabets on 12/13/21.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var expandedIndexSet : IndexSet = []
    
    private let images = ["https://via.placeholder.com/400x250.png?text=Test1",
                          "https://via.placeholder.com/400x250.png?text=Test2",
                          "https://via.placeholder.com/400x250.png?text=Test3",
                          "https://via.placeholder.com/400x250.png?text=Test4"]
    
    private let texts = ["Text1 \n text1",
                         "Text2 \n text2",
                         "Text3 \n text3",
                         "Text4 \n text4"]

    private let imageCellIdentifier = "ImageTVCell"
    private let buttonCellIdentifier = "ButtonTVCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 180.0
    }

}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
        
        if (expandedIndexSet.contains(indexPath.row)) {
                    expandedIndexSet.remove(indexPath.row)
        } else {
            expandedIndexSet.insert(indexPath.row)
        }
        
        table.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == images.count {
            guard let cell = table.dequeueReusableCell(withIdentifier: buttonCellIdentifier, for: indexPath) as? ButtonTVCell else {
                        print("\n LOG failed to get cell")
                        return UITableViewCell()
                    }
            
            return cell
        } else {
            guard let cell = table.dequeueReusableCell(withIdentifier: imageCellIdentifier, for: indexPath) as? ImageTVCell else {
                        print("\n LOG failed to get cell")
                        return UITableViewCell()
                    }
                    
            cell.setupCell(imageURL: images[indexPath.row],
                           text: texts[indexPath.row])
            
            if expandedIndexSet.contains(indexPath.row) {
              cell.setupNumberOfLines(0)
            } else {
              cell.setupNumberOfLines(1)
            }
                  
            return cell
        }
        
    }
 
}
