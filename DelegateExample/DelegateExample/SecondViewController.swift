//
//  SecondViewController.swift
//  DelegateExample
//
//  Created by Wi on 06/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit
protocol SecondViewControllerDelegate {
    func sendTextToFirstView(text: String?)
}

class SecondViewController: UIViewController ,UITextFieldDelegate {
    // MARK: - Propertes
    
    // MARK: IBOutlet
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // MARK: other propertes
    var data: String?
    var delegate: SecondViewControllerDelegate?
    
    // MARK: - Methods
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.resultLabel.text = "결과 값: \(self.data!)"
        self.textField.becomeFirstResponder()
    }
    
    // MARK: ViewController Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
    // MARK: other method
    
    func configure(){
        // textField
        self.textField.delegate = self
    }
    
    // MARK: textField delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.delegate?.sendTextToFirstView(text: textField.text)
        self.textField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
        
        return true
    }
        
    
}
