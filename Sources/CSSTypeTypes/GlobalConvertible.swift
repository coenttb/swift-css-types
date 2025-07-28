//
//  File.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 25/03/2025.
//

import Foundation

public protocol GlobalConvertible {
    static func global(_ global: Global) -> Self
}

extension GlobalConvertible {
    public init(_ global: Global) {
        self = .global(global)
    }
}

extension GlobalConvertible {
    /// Inherits the value from the parent element
    public static var inherit: Self { .global(.inherit) }
    /// Uses the default value for the property
    public static var initial: Self { .global(.initial) }
    /// Reverts to the browser's default styling
    public static var revert: Self { .global(.revert) }
    /// Reverts to the value established in the previous cascade layer
    public static var revertLayer: Self { .global(.revertLayer) }
    /// Resets to its natural value (acts like `inherit` or `initial` depending on the property)
    public static var unset: Self { .global(.unset) }
}
