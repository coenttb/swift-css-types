//
//  File.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 25/03/2025.
//

import Foundation

/// Global CSS values that can be applied to any CSS property
public enum Global: String, Sendable, CaseIterable, CustomStringConvertible {
    /// Inherits the value from the parent element
    case inherit
    /// Uses the default value for the property
    case initial
    /// Reverts to the browser's default styling
    case revert
    /// Reverts to the value established in the previous cascade layer
    case revertLayer = "revert-layer"
    /// Resets to its natural value (acts like `inherit` or `initial` depending on the property)
    case unset

    public var description: String { self.rawValue }
}
