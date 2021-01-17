# TableView

📄 LibraryViewController

```
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


```


📄 BookCell

```
import UIKit

class BookCell: UITableViewCell {
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var authorLabel: UILabel!
  @IBOutlet var reviewLabel: UILabel!
  
  @IBOutlet var readmeBookMark: UIImageView!
  @IBOutlet var bookThumbnail: UIImageView!
  
}

```



📄 LibraryViewController

```
import UIKit

class DetailViewController: UIViewController {

  let book: Book
  
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var authorLabel: UILabel!
  @IBOutlet var imageView: UIImageView!
  
  @IBAction func updateImage() {
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
    imagePicker.allowsEditing = true
    present(imagePicker, animated: true)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    imageView.image = book.image
    imageView.layer.cornerRadius = 16
    titleLabel.text = book.title
    authorLabel.text = book.author
  }

  
  required init?(coder: NSCoder) {
    fatalError("This sould never be called")
  }
  
  required init?(coder: NSCoder, book: Book) {
    self.book = book
    super.init(coder: coder)
  }
    
}

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let selectedImage = info[.editedImage] as? UIImage else { return }
    imageView.image = selectedImage
    Library.saveImage(selectedImage, forBook: book)
    dismiss(animated: true)
    
  }
}

```
