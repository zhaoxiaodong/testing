//
//  MainVC.swift
//  dddd
//
//  Created by jingzhao on 2018/3/13.
//  Copyright © 2018年 zhaoxiaodong. All rights reserved.
//

import UIKit
import StudentSDK
class MainVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let btn = UIButton()
        self.view.addSubview(btn)
        btn.setTitle("点击跳转", for: .normal)
        btn.backgroundColor = .yellow
        btn.setTitleColor(.black, for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    }
    
    func btnClick() -> Void {
        let vc = ViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
//        self.present(vc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
