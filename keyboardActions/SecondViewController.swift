//
//  SecondViewController.swift
//  keyboardActions
//
//  Created by Tunay Toksöz on 4.07.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    let textfield = UITextField(frame: CGRect(x: 100, y: 50, width: 200, height: 50))

    var initialBounds: CGRect?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        setupUI()
        // Do any additional setup after loading the view.
    }
    

    

    // MARK: - UI Setup
    private func setupUI() {
        textfield.backgroundColor = .secondarySystemBackground
        textfield.placeholder = "Text"
        self.view.addSubview(textfield)
    }
    
    override func viewDidLayoutSubviews() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        initialBounds = view.bounds
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.frame = CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height)
      
    }
    
    
           @objc func keyboardWillShow() {
               guard let initialBounds = initialBounds else {
                   return
               }
               view.frame = initialBounds
           }
           
           @objc func keyboardWillHide() {
               guard let initialBounds = initialBounds else {
                   return
               }
               
               view.frame = CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height)
           }
           
           deinit {
               NotificationCenter.default.removeObserver(self)
           }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
