//
//  HomeViewController.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/27.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    lazy var showDatePickerBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("日期选择器", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var showSinglePickerBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("单项选择器", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var verifyPhoneNumberBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("验证电话号码", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var verifyPasswordBtn:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("验证密码", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .blue
        return btn
    }()
    
    lazy var textInputV: UITextField =  {
        let tf = UITextField()
        tf.backgroundColor = .light200
        return tf
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(showDatePickerBtn)
        view.addSubview(showSinglePickerBtn)
        view.addSubview(textInputV)
        view.addSubview(verifyPhoneNumberBtn)
        view.addSubview(verifyPasswordBtn)
        showDatePickerBtn.addTarget(self, action: #selector(showDatePicker), for: .touchUpInside)
        showSinglePickerBtn.addTarget(self, action: #selector(showSinglePicker), for: .touchUpInside)
        verifyPhoneNumberBtn.addTarget(self, action: #selector(verifyPhone), for: .touchUpInside)
        verifyPasswordBtn.addTarget(self, action: #selector(verifyPwd), for: .touchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        showDatePickerBtn.snp.makeConstraints { (make) in
            make.width.equalTo((view.width - 150) / 2)
            make.height.equalTo(50)
            make.left.equalTo(50)
            make.top.equalTo(view.safeAreaInsets.top + 20)
        }
        
        showSinglePickerBtn.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(showDatePickerBtn)
            make.left.equalTo(showDatePickerBtn.snp.right).offset(50)
            make.top.equalTo(view.safeAreaInsets.top + 20)
        }
        
        textInputV.snp.makeConstraints { (make) in
            make.top.equalTo(showDatePickerBtn.snp.bottom).offset(20)
            make.height.equalTo(45)
            make.width.equalTo(view.width - 50)
            make.left.equalTo(25)
        }
        
        verifyPhoneNumberBtn.snp.makeConstraints { (make) in
            make.width.height.left.equalTo(showDatePickerBtn)
            make.top.equalTo(textInputV.snp.bottom).offset(20)
        }
        
        verifyPasswordBtn.snp.makeConstraints { (make) in
            make.width.height.left.equalTo(showSinglePickerBtn)
            make.top.equalTo(verifyPhoneNumberBtn)
        }
    }
    

    @objc fileprivate func showDatePicker(){
        let datap = DatePickerController.init()
        datap.modalPresentationStyle = .overFullScreen
        present(datap, animated: false, completion: nil)
    }
    
    @objc fileprivate func showSinglePicker(){
        let datap = SinglePickerController.init()
        datap.modalPresentationStyle = .overFullScreen
        present(datap, animated: false, completion: nil)
    }
    
    @objc fileprivate func verifyPwd(){
        
        textInputV.endEditing(true)
        TextInputVerify.verifyPassword(textInputV.text ?? "")
    }
    
    @objc fileprivate func verifyPhone(){
        textInputV.endEditing(true)
        TextInputVerify.verifyPhoneNumber(textInputV.text ?? "")
    }
}
