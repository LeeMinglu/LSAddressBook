//
//  LSAddViewController.swift
//  LSAddressBook
//
//  Created by 李明禄 on 2017/1/19.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

class LSAddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberOfTelPhone: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameTextField.addTarget(self, action: #selector(textchange), for: .editingChanged)
        self.numberOfTelPhone.addTarget(self, action: #selector(textchange), for: .editingChanged)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
        self.nameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textchange() {
        
        self.addBtn.isEnabled = !(self.nameTextField.text!.isEmpty) && !(self.numberOfTelPhone.text!.isEmpty)
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
