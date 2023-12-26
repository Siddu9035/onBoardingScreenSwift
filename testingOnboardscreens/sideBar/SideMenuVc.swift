//
//  SideMenuVc.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 19/12/23.
//

import UIKit

class SideMenuVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var myView: UIView!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var myView1: UIView!
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var myView3: UIView!
    
    
    var myArray: [SideCellData] = [
    SideCellData(image: "home", title: "Home"),
    SideCellData(image: "aboutUs", title: "About Us"),
    SideCellData(image: "setting", title: "Setting"),
    SideCellData(image: "contactUs", title: "Contact Us"),
    ]
    var isOpenSideMenu: Bool = false
    
    @IBOutlet var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.delegate = self
        myTableView.dataSource = self
        registerTableCell()
        
        myView.isHidden = true
//        myTableView.isHidden = true
//        myView3.isHidden = true
//        isOpenSideMenu = false
        
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapOnView(_ :)))
//        tap.cancelsTouchesInView = false
//        myView1.addGestureRecognizer(tap)
    }
    
    func registerTableCell() {
        myTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ReuseableCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let val = myArray[indexPath.row]
        let cellInfo = myTableView.dequeueReusableCell(withIdentifier: "ReuseableCell", for: indexPath) as! TableViewCell
        cellInfo.imageView1.image = UIImage(named: val.image)
        cellInfo.imageViewText.text = val.title
        return cellInfo
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        print("clicked")
////        if indexPath.row == 0 {
////            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////            let homeVc = storyBoard.instantiateViewController(withIdentifier: "homeVc") as! ViewController
////            navigationController?.pushViewController(homeVc, animated: true)
////            self.myView.isHidden = true
////        } else if indexPath.row == 1 {
////            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
////            let aboutUsVc = storyBoard.instantiateViewController(withIdentifier: "AboutUsVc") as! SegementVc
////            navigationController?.pushViewController(aboutUsVc, animated: true)
////        }
//    }
    
//    @objc func handleTapOnView(_ sender: UITapGestureRecognizer) {
//        UIView.animate(withDuration: 3) {
//            self.myView.isHidden = true
//        }
//    }
    @IBAction func onPressMenuButton(_ sender: UIButton) {
        UIView.animate(withDuration: 3) {
            self.myView.isHidden.toggle()
        }
    }

}
