//
//  HomeViewController.swift
//  myNewsApp
//
//  Created by sanjog agarwal on 16/08/19.
//  Copyright © 2019 MyOrg. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Kingfisher

class HomeViewController: UIViewController {
    var homeView : HomeView { return self.view as! HomeView}
    var articles :Array<Article> = []
    
    override func loadView() {
        self.view = HomeView()
    }
    
    override func viewDidLoad() {
        title = "Recent News"
        
        setupTableView()
        
        let session = URLSession.shared
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=90e35208ebd3454395ec8af218be4417")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                if let articleArray = jsonData["articles"] as? [[String:Any]]{
                    for articleData in articleArray {
                        guard let article = Mapper<Article>().map(JSON: articleData) else{continue}
                        self.articles.append(article)
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            print("Error : \(String(describing: error))")
            
            DispatchQueue.main.async {
                self.homeView.tableView.reloadData()
            }
        })
        task.resume()
    }
    
    func setupTableView(){
        homeView.tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: NewsCell.kCellIdentifier)
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
}

extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.kCellIdentifier,for: indexPath) as! NewsCell
        let article = articles[indexPath.row]
        cell.articleLabel.text = article.title
        if let url = URL(string: article.imageURL){
            cell.thumbnailView.kf.setImage(with: url)
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let article = articles[indexPath.row]
        if let url = URL(string: article.URL){
            UIApplication.shared.open(url)
        }
    }
    
    func tableView(_ tableView:UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 110.0
    }
}
