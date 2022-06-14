//
//  MemoViewController.swift
//  Memo
//
//  Created by Risako Kato on 2022/06/10.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults().self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveData.value(forKey: "title") as? String
        contentTextView.text = saveData.value(forKey: "content") as? String
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo(){
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler:{ action in
                    self.navigationController?.popViewController(animated: true)
                }
            )
        )
        
        present(alert, animated:true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
