//
//  CategoriesVC.swift
//  New Tabsera Design
//
//  Created by Abdur Rehman on 03/07/2023.
//

import UIKit

struct TableData {
    var title: String
    var isOpened: Bool
    var sectionData: [String]
    
}

class CategoriesVC: UIViewController {

    var tableData = [
        TableData(title: "Title 1", isOpened: false, sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
        TableData(title: "Title 2", isOpened: false, sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
        TableData(title: "Title 3", isOpened: false, sectionData: ["Cell 1", "Cell 2", "Cell 3"]),
        TableData(title: "Title 4", isOpened: false, sectionData: ["Cell 1", "Cell 2", "Cell 3"])
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDelegates()
    }
    
    func setDelegates() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

}

extension CategoriesVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableData[section].isOpened {
            return tableData[section].sectionData.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UIButton(type: .custom)
        label.setTitle(tableData[section].title, for: .normal)
        label.contentHorizontalAlignment = .left
        label.setTitleColor(UIColor.black, for: .normal)
        label.tag = section
        label.addTarget(self, action: #selector(sectionTap), for: .touchUpInside)
        return label
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = tableData[indexPath.section].sectionData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    @IBAction func sectionTap(_ sender: UIButton) {
        let sectionTag = sender.tag
        if tableData[sectionTag].isOpened {
            tableData[sectionTag].isOpened = false
            tableViewCollapeSection(sectionTag)
        }
        else {
            tableData[sectionTag].isOpened = true
            tableViewExpandSection(sectionTag)
        }
    }
    
    func tableViewCollapeSection(_ section: Int) {
        let sectionData = self.tableData[section].sectionData
        
        if (sectionData.count == 0) {
            return;
        } else {
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.tableView!.beginUpdates()
            self.tableView!.deleteRows(at: indexesPath, with: UITableView.RowAnimation.fade)
            self.tableView!.endUpdates()
        }
    }
    
    func tableViewExpandSection(_ section: Int) {
        let sectionData = self.tableData[section].sectionData
        
        if (sectionData.count == 0) {
            self.tableData[section].isOpened = true
            return;
        } else {
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            
            self.tableView!.beginUpdates()
            self.tableView!.insertRows(at: indexesPath, with: UITableView.RowAnimation.fade)
            self.tableView!.endUpdates()
        }
    }

}



//extension CategoriesVC: UITableViewDataSource, UITableViewDelegate {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return tableData.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableData[section].isOpened {
//            return tableData[section].sectionData.count + 1
//        } else {
//            return 1
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
//            cell.textLabel?.text = tableData[indexPath.section].title
//            return cell
//        } else {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
//            cell.textLabel?.text = tableData[indexPath.section].sectionData[indexPath.row - 1]
//            return cell
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row != 0 {
//            return
//        }
//        if tableData[indexPath.section].isOpened {
//            tableData[indexPath.section].isOpened = false
//            let sections = IndexSet.init(integer: indexPath.section)
//            tableView.reloadSections(sections, with: .none)
//        }
//        else {
//            tableData[indexPath.section].isOpened = true
//            let sections = IndexSet.init(integer: indexPath.section)
//            tableView.reloadSections(sections, with: .none)
//        }
//    }
//}
