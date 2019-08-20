//
//  NewsCell.swift
//  myNewsApp
//
//  Created by sanjog agarwal on 16/08/19.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import Foundation
import UIKit

class NewsCell : UITableViewCell {
    
    static let kCellIdentifier = "news-cell"
    
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    class func instanceFromNib() -> NewsCell{
        return UINib(nibName:"NewsCell", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NewsCell
    }
}
