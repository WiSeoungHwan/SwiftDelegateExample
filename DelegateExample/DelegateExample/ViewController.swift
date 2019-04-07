//
//  ViewController.swift
//  DelegateExample
//
//  Created by Wi on 06/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate, SecondViewControllerDelegate{
    
    // MARK: - Propertes
    
    // MARK: IBOutlet
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: Other Propertes
    
    
    // MARK: - Methods
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }
    
    // MARK: other methods
    
    func configure(){
        self.textField.delegate = self
    }
    
    // MARK: ViewController Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SecondViewController" else{ print("identifier error"); return}
        guard let vc = segue.destination as? SecondViewController else {return}
        vc.delegate = self
        vc.data = textField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
    }
    
    
    
    // MARK: SecondVC delegate method
    
    func sendTextToFirstView(text: String?) {
        self.resultLabel.text = "결과값: \(text!)"
    }
    
    // MARK: textField delegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}

