//
//  LSEditeViewController.swift
//  LSAddressBook
//
//  Created by 李明禄 on 2017/1/21.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit

protocol LSEditViewControllerDelegate {
    func motifiedBtnClicked(editeVC: LSEditeViewController, contact: LSContact)
}

class LSEditeViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    var deleagte: LSEditViewControllerDelegate?
    
    var contact: LSContact! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.addTarget(self, action: #selector(textchange), for: .editingChanged)
        self.phoneTextField.addTarget(self, action: #selector(textchange), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    
    func textchange() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.nameTextField.text = contact.name!
        self.phoneTextField.text = contact.phone!
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.contact.name = self.nameTextField.text
        self.contact.phone = self.phoneTextField.text
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func modifiedBtn(_ sender: Any) {
        self.deleagte?.motifiedBtnClicked(editeVC: self, contact: contact)
        
        self.navigationController!.popViewController(animated: true)
        
    }
}
