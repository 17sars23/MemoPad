//
//  MemoViewController.swift
//  MemoPad
//
//  Created by kawagishi on 2018/02/09.
//  Copyright © 2018年 juna Kawagishi. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    //----------------------------
    //Setting variable
    //----------------------------
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    //----------------------------
    //Setting function
    //----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        titleTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //----------------------------
    //original function
    //----------------------------
    
    //改行でキーボード消す
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveMemo(){
        saveData.set(titleTextField.text, forKey:"title")
        saveData.set(contentTextView.text, forKey:"content")
        
        //alertの見た目の設定
        let alert: UIAlertController = UIAlertController(title: "Save", message: "保存したやで", preferredStyle: .alert)
        
        //アラート押した時の設定
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                          handler: { action in
                            //押された後自動的に前の画面へ
                            self.navigationController?.popViewController(animated: true)
            })
        )
        
        //アラートの表示
        present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
