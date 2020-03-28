//
//  SinglePickerController.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/28.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit

class SinglePickerController: BaseViewController {

    var selectedCallback:(String) -> Void = {year in}
    
    var dateYears:[String] = []
    
    lazy var datePickerView:SinglePickerView = {
        
        let picker = SinglePickerView()
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let yearStr = format.string(from: Date())
        let currentYearInt = Int(yearStr)!
        dateYears.append(yearStr)
        for ind in 1...4{
            
            let y = currentYearInt - ind
            
            
            dateYears.append(y.description)
        }
        
        view.backgroundColor = UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.25)
        datePickerView.size = CGSize.init(width: view.width, height: view.height * 0.3)
        datePickerView.y = view.height
        datePickerView.pickerView.delegate = self
        datePickerView.pickerView.dataSource = self
        view.addSubview(datePickerView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        showDateView()
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hiddenDateView()
    }
    
    fileprivate func showDateView(){
        UIView.animate(withDuration: 0.25) {
            self.datePickerView.y = self.view.height * 0.7
        }
    }
    
    fileprivate func hiddenDateView(){
        UIView.animate(withDuration: 0.25) {
            self.datePickerView.y = self.view.height
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
}

extension SinglePickerController: SinglePickerViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateYears.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dateYears[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        datePickerView.setTitleDate(dateYears[row])
    }
    
    func datePickerViewCancelClick() {
        hiddenDateView()
    }
    
    func datePickerViewConfirmClick() {
        hiddenDateView()
        selectedCallback(dateYears[datePickerView.pickerView.selectedRow(inComponent: 0)])
    }
}

@objc protocol SinglePickerViewDelegate {
    @objc optional func datePickerViewCancelClick()
    @objc optional func datePickerViewConfirmClick()
}

class SinglePickerView: BaseView{
    
    weak var delegate:SinglePickerViewDelegate?
    
    var currentIndexPath:IndexPath = IndexPath()
    
    lazy var contentBGView:UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    lazy var pickerView:UIPickerView = {
        let pick = UIPickerView.init()
        return pick
    }()
    
    private lazy var cancelBtn:UIButton = {
        
        let b = UIButton.buttonWith(title: "取 消", titleColor: .white, font: UIFont.font_16, selector: #selector(cancelClick), target: self)
        b.cornerRadius = 5
        b.borderWidth = 1
        b.borderColor = .white
        return b
    }()
    
    private lazy var confirmBtn:UIButton = {
        
        let b = UIButton.buttonWith(title: "确 定", titleColor: .white, font: UIFont.font_16, selector: #selector(confirmClick), target: self)
        b.cornerRadius = 5
        b.borderWidth = 1
        b.borderColor = .white
        return b
    }()
    
    private lazy var titleL:UILabel = {
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let tit = "当前年份：" + format.string(from: Date())
        let l = UILabel.lableWith(text: tit, textColor: .white, bgColor: .clear, cornerRadius: 0)
        l.textAlignment = .center
        l.font = .font_16
        return l
    }()
    
    lazy var topBGView:UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        return v
    }()
    
    @objc private func cancelClick(){
        if delegate != nil {
            delegate!.datePickerViewCancelClick?()
        }
    }
    
    @objc private func confirmClick(){
        if delegate != nil {
            delegate!.datePickerViewConfirmClick?()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if delegate != nil {
            delegate!.datePickerViewCancelClick?()
        }
    }
    
    func setTitleDate(_ dateStr: String){
        titleL.text = "当前年份：" + dateStr
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    override func setView() {
        
        topBGView.addSubview(cancelBtn)
        topBGView.addSubview(titleL)
        topBGView.addSubview(confirmBtn)
        contentBGView.addSubview(topBGView)
        contentBGView.addSubview(pickerView)
        addSubview(contentBGView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentBGView.size = size
        
        topBGView.frame = CGRect.init(x: 0, y: 0, width: width, height: contentBGView.height * 0.225)
        cancelBtn.frame = CGRect.init(x: 10, y: 10, width: width * 0.175, height: topBGView.height - 20)
        titleL.frame = CGRect.init(x: width / 2 - width * 0.25, y: 0, width: width * 0.5, height: topBGView.height)
        confirmBtn.frame = CGRect.init(x: width - 10 - cancelBtn.width, y: 10, width: cancelBtn.width, height: cancelBtn.height)
        
        pickerView.frame = CGRect.init(x: 0, y: topBGView.maxY, width: width, height: contentBGView.height * 0.775)
        
    }
}
