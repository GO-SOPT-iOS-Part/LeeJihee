//
//  TableViewItem.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/03.
//
import UIKit

enum TableViewItem: Equatable {
  case poster(UIImage?, String) // thumbnailImage, name
  case collection(String, [CollectionViewItem]) // name, collection
}

enum CollectionViewItem: Equatable {
  case color(UIColor)
}
