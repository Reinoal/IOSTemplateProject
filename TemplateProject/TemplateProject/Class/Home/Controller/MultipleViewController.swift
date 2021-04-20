//
//  MultipleViewController.swift
//  TemplateProject
//
//  Created by Reinoal on 2020/3/30.
//  Copyright © 2020 RDX. All rights reserved.
//

import UIKit


class MultipleViewController: BaseViewController {

    lazy var m_itemScrollBarView: MultipleScrollBar = MultipleScrollBar()
    
    var currentIndex: Int = 0{
        didSet{
            m_itemScrollBarView.setCurrentSelectedBtn(index: currentIndex)
        }
    }
    
    lazy var m_controllersScrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = false
        sc.showsHorizontalScrollIndicator = false
        sc.bounces = false
        sc.isPagingEnabled = true
        sc.delegate = self
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(m_itemScrollBarView)
        view.addSubview(m_controllersScrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        m_itemScrollBarView.setControllersItems([])
        addChildCOntrollerWith(items: [])
        m_itemScrollBarView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(45)
            make.left.right.equalTo(0)
            make.top.equalTo(view.safeAreaInsets.top)
        }
        
        m_controllersScrollView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(view.height - 45)
            make.top.equalTo(m_itemScrollBarView.snp.bottom)
            make.left.right.equalTo(0)
        }
    }
    
    fileprivate func loadControllerData(){
        
        
    }
    
    fileprivate func addChildCOntrollerWith(items: [MultipleControllerItemModel]){
        
        let con = HomeViewController()
        con.view.backgroundColor = .blue
        addChild(con)
        m_controllersScrollView.addSubview(con.view)
        con.view.snp.makeConstraints { (make) in
            make.width.equalTo(view.width)
            make.height.equalTo(view.height - 45)
            make.top.equalTo(0)
        }
        let con1 = HomeViewController()
        con1.view.backgroundColor = .cyan
        addChild(con1)
        m_controllersScrollView.addSubview(con1.view)
        con1.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con.view.snp.right)
        }
        
        let con2 = HomeViewController()
        con2.view.backgroundColor = .cyan
        addChild(con2)
        m_controllersScrollView.addSubview(con2.view)
        con2.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con1.view.snp.right)
        }
        
        let con3 = HomeViewController()
        con3.view.backgroundColor = .cyan
        addChild(con3)
        m_controllersScrollView.addSubview(con3.view)
        con3.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con2.view.snp.right)
        }
        
        let con4 = HomeViewController()
        con4.view.backgroundColor = .cyan
        addChild(con4)
        m_controllersScrollView.addSubview(con4.view)
        con4.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con3.view.snp.right)
        }
        
        let con5 = HomeViewController()
        con5.view.backgroundColor = .cyan
        addChild(con5)
        m_controllersScrollView.addSubview(con5.view)
        con5.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con4.view.snp.right)
        }
        
        let con6 = HomeViewController()
        con6.view.backgroundColor = .cyan
        addChild(con6)
        m_controllersScrollView.addSubview(con6.view)
        con6.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con5.view.snp.right)
        }
        
        let con7 = HomeViewController()
        con7.view.backgroundColor = .cyan
        addChild(con7)
        m_controllersScrollView.addSubview(con7.view)
        con7.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con6.view.snp.right)
        }
        
        let con8 = HomeViewController()
        con8.view.backgroundColor = .cyan
        addChild(con8)
        m_controllersScrollView.addSubview(con8.view)
        con8.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con7.view.snp.right)
        }
        
        let con9 = HomeViewController()
        con9.view.backgroundColor = .cyan
        addChild(con9)
        m_controllersScrollView.addSubview(con9.view)
        con9.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con8.view.snp.right)
        }
        
        let con10 = HomeViewController()
        con10.view.backgroundColor = .cyan
        addChild(con10)
        m_controllersScrollView.addSubview(con10.view)
        con10.view.snp.makeConstraints { (make) in
            make.width.height.top.equalTo(con.view)
            make.left.equalTo(con9.view.snp.right)
        }
        m_controllersScrollView.contentSize = CGSize.init(width: view.width * 11, height: 0)
    }

    
    
}

extension MultipleViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.mj_offsetX.truncatingRemainder(dividingBy: scrollView.width) == 0{

            currentIndex = Int(scrollView.mj_offsetX / scrollView.width)
        }
    }
}

struct MultipleControllerItemModel {
    
    var title: String
    
    var identifier: String
    
    var url: String
    
    var index: Int = 0
    
    var type: String
}

class MultipleScrollBar: BaseView{
    
    var currentSelectedBtn: UIButton!
    
    func setCurrentSelectedBtn(index: Int){
        guard index < controllersScrollBar.subviews.count else {return}
        
        if let btn = controllersScrollBar.subviews[index] as? UIButton{
            currentSelectedBtn.isSelected = false
            btn.isSelected = true
            currentSelectedBtn = btn
            
            let newX = btn.convert(btn.frame, to: self).origin.x
            
            if newX <= 0 {
                controllersScrollBar.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
            }
            else if (newX + btn.width) > self.width
            {
                
                if superview!.frame.contains(btn.frame){
                    
                }
                else
                {
                    controllersScrollBar.setContentOffset(CGPoint.init(x: newX - width + btn.width, y: 0), animated: true)
                }
                
            }
        }
    }
    
    func setControllersItems(_ items:[MultipleControllerItemModel]){
        
        let btnSize = CGSize.init(width: 80, height: 45)
        
        for i in 0...10{
            
            let b = UIButton()
            i == 0 ? b.isSelected = true : nil
            i == 0 ? currentSelectedBtn = b : nil
            b.setTitle("标题\(i + 1)", for: .normal)
            b.setTitleColor(.white, for: .normal)
            b.setTitleColor(.red, for: .selected)
            controllersScrollBar.addSubview(b)
            b.snp.makeConstraints { (make) in
                make.left.equalTo(CGFloat(i) * btnSize.width)
                make.top.equalTo(0)
                make.width.equalTo(btnSize.width)
                make.height.equalTo(btnSize.height)
            }
        }
        
        controllersScrollBar.contentSize = CGSize.init(width: 11 * 80, height: 0)
    }
    
    lazy var controllersScrollBar: UIScrollView = {
        
       let sb = UIScrollView()
        sb.showsVerticalScrollIndicator = false
        sb.showsHorizontalScrollIndicator = false
        sb.bounces = false
        return sb
    }()
    
    override func setView() {
        addSubview(controllersScrollBar)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        controllersScrollBar.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.edges.equalTo(0)
        }
    }
}
