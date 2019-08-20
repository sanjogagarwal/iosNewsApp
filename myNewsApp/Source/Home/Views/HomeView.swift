//
//  HomeView.swift
//  myNewsApp
//
//  Created by sanjog agarwal on 16/08/19.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HomeView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(tableView)
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout
    
    func setupLayout(){
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
