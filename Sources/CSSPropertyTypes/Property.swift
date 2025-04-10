//
//  Property.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 27/03/2025.
//

import Foundation
import CSSTypeTypes

/// A protocol that all CSS properties conform to
///
/// This protocol represents a CSS property in the Swift-CSS library.
/// It provides the core requirements for all CSS properties including
/// being thread-safe (Sendable), comparable (Equatable), string-convertible
/// (CustomStringConvertible), and supporting global CSS values (GlobalConvertible).
public protocol Property: Sendable, Equatable, CustomStringConvertible, GlobalConvertible {

    static var property: String { get }
}

extension Property {
    public var declaration: Declaration {
        .init(self)
    }
}

public struct Declaration: Sendable, Hashable, CustomStringConvertible {
    public let description: String
}

extension Declaration {
    public init<Propery: Property>(_ property: Propery){
        self.description = "\(Propery.property):\(property.description)"
    }
}


