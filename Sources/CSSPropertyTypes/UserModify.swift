//
//  UserModify.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `user-modify` property is a non-standard, deprecated property that was originally planned 
/// to determine whether or not the content of an element can be edited by a user.
///
/// - Warning: This property is deprecated and non-standard. It has been replaced by the 
///           `contenteditable` HTML attribute. Avoid using it in production websites.
///
/// - SeeAlso: [MDN Web Docs on user-modify](https://developer.mozilla.org/en-US/docs/Web/CSS/user-modify)
public enum UserModify: Property {

    public static let property: String = "user-modify"

    /// Default value. Contents are read-only.
    case readOnly

    /// The user is able to read and write contents.
    case readWrite

    /// Same as read-write, but rich text formatting will be lost.
    case readWritePlaintextOnly

    /// The user is able to edit the content, but not to read it.
    case writeOnly

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .readOnly: return "read-only"
        case .readWrite: return "read-write"
        case .readWritePlaintextOnly: return "read-write-plaintext-only"
        case .writeOnly: return "write-only"
        case .global(let global): return global.description
        }
    }
}
