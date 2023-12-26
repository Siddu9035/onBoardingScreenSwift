//
//  ViewController.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 13/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var myView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    
    var timer = Timer()
    var secondsFinished = 0
    var totalTime = 0
    
    var eggsTime = ["Soft": 10, "Medium": 15, "Hard": 20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func Buttons(_ sender: UIButton) {
        //this is for the alert when clicked on the perticular eggs
        let alert = UIAlertController(title: "Cooking Started", message: "You clicked On \(sender.currentTitle ?? "")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
        
        textLabel.text = "Cooking...."
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggsTime[hardness]!
        progressView.progress = 0.0
        secondsFinished = 0
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(upDate), userInfo: nil, repeats: true)
    }
    
   @objc func upDate() {
       if secondsFinished < totalTime {
           secondsFinished += 1
           progressView.progress = Float(secondsFinished) / Float(totalTime)
       } else {
           textLabel.text = "Done."
           timer.invalidate()
       }
    }
    
    @IBAction func switchButtonPressed(_ sender: UISwitch) {
        
        if sender.isOn {
            myView.backgroundColor = UIColor.orange
        } else {
            myView.backgroundColor = UIColor(named: "mine1")
        }
    }
    @IBAction func mySlider(_ sender: UISlider) {
        let value = CGFloat(sender.value)
        imageView.transform = CGAffineTransform(scaleX: value, y: value)
    }
    @IBAction func onDateChange(_ sender: UIDatePicker) {
        
        //get the date from datepicker
        let date = sender.date
        //create the date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        //convert the date formatter to string using dateformatter
        let dateString = dateFormatter.string(from: date)
        
        dateLabel.text = dateString
        
        let actionAlert = UIAlertController(title: "DOB", message: "Selected DOB is: \(dateString)", preferredStyle: .actionSheet)
        actionAlert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(actionAlert, animated: true)
    }
    @IBAction func goToButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let goToSecondVc = storyBoard.instantiateViewController(withIdentifier: "second") as! SecondVc
        navigationController?.pushViewController(goToSecondVc, animated: true)
        
    }
    
}
