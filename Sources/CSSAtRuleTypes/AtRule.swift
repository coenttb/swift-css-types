//
//  File.swift
//  swift-css-types
//
//  Created by Coen ten Thije Boonkkamp on 16/04/2025.
//

public protocol AtRule: RawRepresentable & Hashable & Sendable {
    static var identifier: String { get }
}
