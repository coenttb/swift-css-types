//
//  TransitionProperty.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `transition-property` property specifies the names of the CSS properties to which
/// a transition effect should be applied.
///
/// This property defines which properties will be affected by a transition. Only the properties
/// listed will be animated during the transition; changes to all other properties occur instantaneously
/// as usual.
///
/// Example:
/// ```swift
/// .transitionProperty(.all)  // transition-property: all
/// .transitionProperty(.none) // transition-property: none
/// .transitionProperty(.custom("opacity")) // transition-property: opacity
/// .transitionProperty(.list(["width", "height"])) // transition-property: width, height
/// ```
///
/// - SeeAlso: [MDN Web Docs on transition-property](https://developer.mozilla.org/en-US/docs/Web/CSS/transition-property)
public enum TransitionProperty: Property {

    public static let property: String = "transition-property"

    /// Apply transitions to all properties that change
    case all

    /// Apply transitions to no properties
    case none

    /// Apply transitions to a specific property by name
    case custom(CSSString)

    /// Apply transitions to a list of properties by name
    case list([String])

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .all:
            return "all"
        case .none:
            return "none"
        case .custom(let property):
            return property.description
        case .list(let properties):
            return properties.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }

    /// Creates a transition property with multiple property names
    public init(_ properties: [String]) {
        if properties.isEmpty {
            self = .none
        } else if properties.count == 1 {
            self = .custom(.init(properties[0]))
        } else {
            self = .list(properties)
        }
    }

    /// Creates a transition property with multiple property names
    public init(_ properties: String...) {
        self.init(properties)
    }
}
