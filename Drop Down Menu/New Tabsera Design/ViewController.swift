//
//  ViewController.swift
//  New Tabsera Design
//
//  Created by Abdur Rehman on 08/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var customerLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet weak var profileImg: UIImageView!

    let settings = [
        AccSettingsTVCModel(iconImage: "BlackMenu", title: "CATEGORIES",type: SETTINGS.CATEGORIES),
        AccSettingsTVCModel(iconImage: "BlackPlus", title: "SELL ON DAANEYEH",type: SETTINGS.SELL_ON_DAANEYEH),
        AccSettingsTVCModel(iconImage: "SomaliFlag", title: "LANGUAGE",type: SETTINGS.LANGUAGE),
        AccSettingsTVCModel(iconImage: "BlackMenu", title: "MY ORDERS",type: SETTINGS.MY_ORDERS),
        AccSettingsTVCModel(iconImage: "BlackMenu", title: "TRACK MY ORDER",type: SETTINGS.TRACK_MY_ORDER),
        AccSettingsTVCModel(iconImage: "BlackMenu", title: "CUSTOMER CARE",type: SETTINGS.CUSTOMER_CARE)
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setDelegates()
    }

    func setDelegates() {
        tableView.register(UINib(nibName: "MenuCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuCellTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func tapCrossButton(_ sender: UIButton) {
        
    }
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MenuCellTableViewCell.HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuCellTableViewCell.tableViewCell(tableView: tableView, indexPath: indexPath)
        cell.setData(data: settings[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


class AccSettingsTVCModel{
    let iconImage: String
    let title:String
    let arrowImage: String
    var type: SETTINGS = SETTINGS.CATEGORIES
    
    init(iconImage: String,title: String) {
        self.iconImage=iconImage
        self.title=title
        self.arrowImage="ic_arrow_right"
    }
    
    init(iconImage: String,title: String, type:SETTINGS) {
        self.iconImage=iconImage
        self.title=title
        self.arrowImage="ic_arrow_right"
        self.type=type
    }
    
    init(iconImage: String,title: String,arrowImage: String) {
        self.iconImage=iconImage
        self.title=title
        self.arrowImage=arrowImage
    }
}



// all settings
public enum SETTINGS:Int{
    case CATEGORIES=0
    case SELL_ON_DAANEYEH=1
    case LANGUAGE=2
    case MY_ORDERS=3
    case TRACK_MY_ORDER=4
    case CUSTOMER_CARE=5
    case HELP=6
    case LOGOUT=7
    case WALLET=8
    case COUPONS=9
    case BILL_PAYMENTS=10
    case TOPUPS=11
}
