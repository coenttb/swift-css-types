//
//  File.swift
//  swift-css-types
//
//  Created by Coen ten Thije Boonkkamp on 22/07/2025.
//

public protocol CSSPseudoElement: Sendable, Hashable, CustomStringConvertible {
    static var name: String { get }
}

extension CSSPseudoElement {
    @inlinable static var prefix: String { "::" }
    public var description: String { Self.prefix + Self.name }
}
