//
//  SecondVc.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 15/12/23.
//

import UIKit

class SecondVc: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var pickerLabel: UILabel!
    
    
//    var someData = ["Animal", "Sam bahaddur", "Kantara-1", "Fighter", "KGF-3"]
    var someData: [cellInfo] = [
    cellInfo(images: "kantara", imageTextName: "Kantara"),
    cellInfo(images: "fighter", imageTextName: "Fighter"),
    cellInfo(images: "kgf2", imageTextName: "K G F-2"),
    cellInfo(images: "sambahaddur", imageTextName: "Sam-bahaddur"),
    cellInfo(images: "animal", imageTextName: "Animal")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Siddappa"
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return someData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return someData[row].imageTextName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerLabel.text = "Watched Movies: \(someData[row].imageTextName)"
        
        let customModal = CustomPopUp()
        
        // Set the image and text in CustomPopUp based on the selected row
        let imageName = someData[row].images
        if let image = UIImage(named: imageName) {
                customModal.selectedImage = image
            }
        customModal.selectedText = someData[row].imageTextName
        customModal.presentPopUp(viewController: self)
    }
    @IBAction func pressMebutton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let webVc = storyBoard.instantiateViewController(withIdentifier: "webView") as! WebViewVc
        navigationController?.pushViewController(webVc, animated: true)
    }
    
}
