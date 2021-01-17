//
//  ViewController.swift
//  TableViews
//
//  Created by Henry AT on 16-01-21.
//

import UIKit

class LibraryViewController: UITableViewController {

  
  @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
    
    guard let indexPath = tableView.indexPathForSelectedRow else {
      fatalError("Nothing selected")
    }
    
    let book = Library.books[indexPath.row]
    
    return DetailViewController(coder: coder, book: book)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.reloadData()
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    Library.books.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell else {
      fatalError("Could not create BookCell")
    }
    let book = Library.books[indexPath.row]
    cell.titleLabel.text = book.title
    cell.authorLabel.text = book.author
    cell.bookThumbnail.image = book.image
    cell.bookThumbnail.layer.cornerRadius = 12    
    return cell
  }

}

