//
//  GenericValueProtocol.swift
//  myTunes
//
//  Created by Hüsnü Taş on 26.10.2021.
//

import Foundation

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
