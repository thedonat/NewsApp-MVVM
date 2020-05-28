//
//  NewsTableViewController.swift
//  News App
//
//  Created by Burak Donat on 24.03.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
import UIKit

class NewsTableViewController: UIViewController {
    
    private var articleListVM: ArticleListViewModal!
    @IBOutlet var tableView: UITableView!

    let url = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=fa68fee749e04314a452180019ed7fae"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        getData()
    }
    
    func getData() {
        WebService().performRequest(urlString: url) { (articles) in
            if let articles = articles {
                self.articleListVM = ArticleListViewModal(articles: articles.articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension NewsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! ArticleTableViewCell
        let articleViewModal = self.articleListVM.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleViewModal.title
        cell.descriptionLabel.text = articleViewModal.description
        
        return cell
    }
}
