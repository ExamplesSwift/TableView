//
//  ViewController.swift
//  TableViews
//
//  Created by Henry AT on 16-01-21.
//

import UIKit

class LibraryViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    Library.books.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
    
//    let book = Book(
//      title: "Title \(indexPath)",
//      author: "Author \(indexPath)",
//      image: UIImage(systemName: "\(indexPath.row).square.fill")!
//    )
    
    cell.textLabel?.text = Library.books[indexPath.row].title
    cell.imageView?.image = Library.books[indexPath.row].image
    
    return cell
  }

}

