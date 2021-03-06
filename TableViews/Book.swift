//
//  Book.swift
//  TableViews
//
//  Created by Henry AT on 16-01-21.
//

import UIKit



struct Book {
  let title: String
  let author: String
  var image: UIImage {
    Library.loadImage(forBook: self) ?? LibrarySymbol.letterSquare(letter: title.first).image
  }
}
