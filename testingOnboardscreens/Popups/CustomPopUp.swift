//
//  CustomPopUp.swift
//  testingOnboardscreens
//
//  Created by siddappa tambakad on 18/12/23.
//

import UIKit

class CustomPopUp: UIViewController {

//    @IBOutlet var transferentView: UIView!
    @IBOutlet var modalView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageNameText: UILabel!
    
    var selectedImage: UIImage?
    var selectedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = selectedImage
        imageNameText.text = selectedText
        
        configView()
    }
    // CustomPopUp View Controller Initialization
    init() {
        super.init(nibName: "CustomPopUp", bundle: nil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //add transferentcolor for view
    func configView() {
//        self.transferentView.backgroundColor = .black.withAlphaComponent(0.0)
//        self.transferentView.alpha = 0
        self.modalView.alpha = 0
        self.modalView.layer.cornerRadius = 20
    }
    
    // Method to present the pop-up view
        func presentPopUp(viewController: UIViewController) {
            viewController.present(self, animated: true)
            
            // Animate the appearance of the pop-up
            UIView.animate(withDuration: 0.3, delay: 0.3) {
//                self.transferentView.alpha = 1
                self.modalView.alpha = 1.0
            }
        }
        // Method to dismiss the pop-up view
        func dismissPopUp() {
            // Animate the disappearance of the pop-up
            UIView.animate(withDuration: 0.3) {
//                self.transferentView.alpha = 0
                self.modalView.alpha = 0
            } completion: { _ in
                self.dismiss(animated: true, completion: nil)
            }
        }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        dismissPopUp()
    }
    
}
