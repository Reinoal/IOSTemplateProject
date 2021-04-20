//
//  DatePickerController.swift
//  MobileCheck
//
//  Created by Reinoal on 2020/3/2.
//  Copyright © 2020 sss. All rights reserved.
//

import UIKit

/// 日期选择
class DatePickerController: UIViewController {

    var dateSelectedClourse:(Date) -> Void = {date in}
    
    lazy var datePickerView:DateView = DateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0.25, green: 0.25, blue: 0.25, alpha: 0.25)
        datePickerView.size = CGSize.init(width: view.width, height: view.height * 0.3)
        datePickerView.y = view.height
        datePickerView.delegate = self
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

extension DatePickerController: DateViewDelegate{
    
    func datePickerViewCancelClick() {
        hiddenDateView()
    }
    
    func datePickerViewConfirmClick(_ date: Date) {
        hiddenDateView()
        dateSelectedClourse(date.chineseDate)
    }
    
    func datePickerViewCancelClick(currentIndexPath: IndexPath) {
        hiddenDateView()
    }
    
    func datePickerViewConfirmClick(_ date: Date, currentIndexPath: IndexPath) {
        hiddenDateView()
    }
}

@objc protocol DateViewDelegate {
    @objc optional func datePickerViewCancelClick()
    @objc optional func datePickerViewConfirmClick(_ date:Date)
    
    @objc optional func datePickerViewCancelClick(currentIndexPath:IndexPath)
    @objc optional func datePickerViewConfirmClick(_ date:Date, currentIndexPath:IndexPath)
}

class DateView:UIView{
    
    weak var delegate:DateViewDelegate?
    
    var currentIndexPath:IndexPath = IndexPath()
    
    lazy var contentBGView:UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    private lazy var pickerView:UIDatePicker = {
        let pick = UIDatePicker.init()
        pick.maximumDate = Date()
        pick.minimumDate = Date.init(timeIntervalSince1970: 0)
        pick.datePickerMode = .date
        pick.locale = Locale.init(identifier: "zh_CN")
        pick.date = Date()
        pick.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
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
        
        let l = UILabel.init(title: nil, font: nil, color: .white, nil, 0)
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
            delegate!.datePickerViewCancelClick?(currentIndexPath: currentIndexPath)
        }
    }
    
    @objc private func confirmClick(){
        if delegate != nil {
            delegate!.datePickerViewConfirmClick?(pickerView.date)
            delegate!.datePickerViewConfirmClick?(pickerView.date, currentIndexPath: currentIndexPath)
        }
    }
    
    @objc private func dateChanged(){
        setTitleDate(title: "当前日期：")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if delegate != nil {
            delegate!.datePickerViewCancelClick?()
            delegate!.datePickerViewCancelClick?(currentIndexPath: currentIndexPath)
        }
    }
    
    func setTitleDate(title: String){
        let dateFormart = DateFormatter()
        dateFormart.dateFormat = "yyyy-MM-dd"
        titleL.text = title + dateFormart.string(from: pickerView.date)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    func setView() {
        
        topBGView.addSubview(cancelBtn)
        topBGView.addSubview(titleL)
        topBGView.addSubview(confirmBtn)
        contentBGView.addSubview(topBGView)
        contentBGView.addSubview(pickerView)
        addSubview(contentBGView)
        setTitleDate(title: "当前日期：")
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
