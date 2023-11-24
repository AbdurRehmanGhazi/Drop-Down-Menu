//
//  MenuCellTableViewCell.swift
//  New Tabsera Design
//
//  Created by Abdur Rehman on 08/06/2023.
//

import UIKit

class MenuCellTableViewCell: UITableViewCell {

    let TAG = "MenuCellTableViewCell"
    static let HEIGHT:CGFloat = 55.0
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func tableViewCell(tableView: UITableView, indexPath: IndexPath) -> MenuCellTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellTableViewCell") as? MenuCellTableViewCell else {
            return MenuCellTableViewCell()
        }
        return cell
    }
    func setData(data: AccSettingsTVCModel) {
        iconImage.image = UIImage(named: data.iconImage)
        titleLbl.text = data.title
    }
}
