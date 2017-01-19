//
//  LSLoginViewController.swift
//  LSAddressBook
//
//  Created by 李明禄 on 2017/1/6.
//  Copyright © 2017年 SocererGroup. All rights reserved.
//

import UIKit


class LSLoginViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var remberPwd: UISwitch!
    @IBOutlet weak var autoLogin: UISwitch!
    
    @IBOutlet weak var loginBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.accountTextField.text! = "rock"
        self.passwordTextField.text! = "rock"
        
//        self.passwordTextField.delegate = self
//        self.accountTextField.delegate = self
        
        self.passwordTextField.addTarget(self, action: #selector(textChange), for: UIControlEvents.editingChanged)
//
        self.accountTextField.addTarget(self, action: #selector(textChange), for: UIControlEvents.editingChanged)
        
//
        self.textChange()
        
//        self.autoLogin.isOn = false
        
        if self.autoLogin.isOn {
            self.clickLoginBtn(Any.self)
        }
        
        self.accountTextField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textChange() {

        if !(self.accountTextField.text!.isEmpty) &&
            !(self.passwordTextField.text!.isEmpty) {
              self.loginBtn.isEnabled = true
        } else {
            self.loginBtn.isEnabled = false
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func autoLogin(_ sender: Any) {
        print("切换了自动登陆")
        
        
       
        
    }
    
    @IBAction func remberPwd(_ sender: Any) {
        print("切换了记住密码")
    }
    
    @IBAction func clickLoginBtn(_ sender: Any) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        
        if self.accountTextField.text! == "rock" && self.passwordTextField.text! == "rock" {
           

            SVProgressHUD.show(withStatus: "正在登陆")
   
            
            
            let three = DispatchTime.now() + 2.0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0, execute: {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
            DispatchQueue.main.asyncAfter(deadline: three, execute: {
                self.performSegue(withIdentifier: "login2Contact", sender: nil)
            })
            


        }else {
            print("用户名或密码不对")
           
            
           
            
             SVProgressHUD.showError(withStatus: "用户名或密码错误")
        }
        
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if !(self.remberPwd.isOn)   {
//            self.accountTextField.text = ""
            self.passwordTextField.text = ""
        } else {
            print("此时会记住密码")
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("*************")
        let sourceController = segue.source
        let destController = segue.destination
        print("源控制器" + "\(sourceController)" + "目标控制器" + "\(destController)"  )
        //在Segue里进行传值
        destController.navigationItem.title = self.accountTextField.text
//        destController.nam
        

    }
}
