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
    
    lazy var m_controllersScrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.showsVerticalScrollIndicator = false
        sc.showsHorizontalScrollIndicator = false
        sc.bounces = false
        sc.isPagingEnabled = true
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(m_itemScrollBarView)
        view.addSubview(m_controllersScrollView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        m_itemScrollBarView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(45)
            make.top.left.right.equalTo(0)
        }
    }
    
    fileprivate func addChildCOntrollerWith(items: [MultipleControllerItemModel]){
        
        

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
    
    func setControllersItems(_ items:[MultipleControllerItemModel]){
        
        
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
