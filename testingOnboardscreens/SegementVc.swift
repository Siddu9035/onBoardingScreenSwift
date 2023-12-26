//
//  SegementVc.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 17/12/23.
//

import UIKit

class SegementVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var segmentButtons: UISegmentedControl!
    @IBOutlet var myView: UIView!
    @IBOutlet var selectButton: UIButton!
    @IBOutlet var myTableView: UITableView!
    
    var countries = ["KA","DL","UP","HP","KL","TN","AP","TS","MH","GJ","JK","WB","MP"]
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        myTableView.dataSource = self
        myTableView.delegate = self
        
        segmentButtons.backgroundColor = .lightGray
        myTableView.isHidden = true
    }
    
    //checking the selected segmentindex has color
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            myView.backgroundColor = .darkGray
        } else if sender.selectedSegmentIndex == 1 {
            myView.backgroundColor = .orange
        }
    }
    @IBAction func OnClickMeButtonPressed(_ sender: UIButton) {
        self.showToast(message: "You Clicked On Button", font: .systemFont(ofSize: 13.0))
    }
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        if myTableView.isHidden {
            animate(togle: true)
        } else {
            animate(togle: false)
        }
    }
    //function for the toggle of dropdown 
    func animate(togle: Bool) {
        if togle {
            UIView.animate(withDuration: 0.3, delay: 0.1) {
                self.myTableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.1) {
                self.myTableView.isHidden = true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cellData.textLabel?.text = countries[indexPath.row]
        return cellData
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectButton.setTitle("\(countries[indexPath.row])", for: .normal)
        animate(togle: false)
    }
    
    
}

//extension for the toastmessages
extension UIViewController {
    func showToast(message: String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-200, width: 150, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
        })
    }
}
