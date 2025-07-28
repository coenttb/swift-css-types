//
//  BoxShadow.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `box-shadow` property adds shadow effects around an element's frame.
///
/// A box shadow is described by X and Y offsets relative to the element, blur and spread radius,
/// and color. You can set multiple shadow effects separated by commas.
///
/// If a border-radius is specified on the element with a box shadow, the box shadow takes on the
/// same rounded corners. The z-ordering of multiple box shadows is the same as multiple text shadows
/// (the first specified shadow is on top).
///
/// - SeeAlso: [MDN Web Docs on box-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/box-shadow)
public enum BoxShadow: Property {
    public static let property: String = "border-shadow"

    /// No shadow effect
    case none

    /// A single shadow effect
    case shadow(Shadow)

    /// Multiple shadow effects (in order of appearance, first shadow on top)
    case multiple([Shadow])

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Represents a single box shadow
    public struct Shadow: Sendable, Hashable, CustomStringConvertible {
        /// The X offset of the shadow (horizontal distance)
        public let offsetX: Length

        /// The Y offset of the shadow (vertical distance)
        public let offsetY: Length

        /// The blur radius of the shadow (optional, default 0)
        public let blurRadius: Length?

        /// The spread radius of the shadow (optional, default 0)
        public let spreadRadius: Length?

        /// The color of the shadow (optional, uses text color if not specified)
        public let color: Color?

        /// Whether the shadow is inset (inner shadow) or not
        public let isInset: Bool

        /// Creates a new box shadow
        ///
        /// - Parameters:
        ///   - offsetX: The horizontal offset of the shadow
        ///   - offsetY: The vertical offset of the shadow
        ///   - blurRadius: The blur radius of the shadow (optional)
        ///   - spreadRadius: The spread radius of the shadow (optional)
        ///   - color: The color of the shadow (optional)
        ///   - isInset: Whether the shadow is an inner shadow (default false)
        public init(
            offsetX: Length,
            offsetY: Length,
            blurRadius: Length? = nil,
            spreadRadius: Length? = nil,
            color: Color? = nil,
            isInset: Bool = false
        ) {
            self.offsetX = offsetX
            self.offsetY = offsetY
            self.blurRadius = blurRadius
            self.spreadRadius = spreadRadius
            self.color = color
            self.isInset = isInset
        }

        /// String representation of the shadow for CSS output
        public var description: String {
            var result = ""

            if isInset {
                result += "inset "
            }

            result += "\(offsetX.description) \(offsetY.description)"

            if let blur = blurRadius {
                result += " \(blur.description)"
            }

            if let spread = spreadRadius {
                result += " \(spread.description)"
            }

            if let shadowColor = color {
                result += " \(shadowColor.description)"
            }

            return result
        }
    }

    /// Creates a box shadow with a single shadow effect
    ///
    /// - Parameter shadow: The shadow effect to apply
    public init(_ shadow: Shadow) {
        self = .shadow(shadow)
    }

    /// Creates a box shadow with multiple shadow effects
    ///
    /// - Parameter shadows: Array of shadow effects to apply
    public init(_ shadows: [Shadow]) {
        if shadows.isEmpty {
            self = .none
        } else if shadows.count == 1 {
            self = .shadow(shadows[0])
        } else {
            self = .multiple(shadows)
        }
    }

    /// Creates a box shadow with multiple shadow effects
    ///
    /// - Parameter shadows: Variadic list of shadow effects to apply
    public init(_ shadows: Shadow...) {
        self.init(shadows)
    }
}

/// Provides string conversion for CSS output
extension BoxShadow: CustomStringConvertible {
    /// String representation of the box-shadow for CSS output
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .shadow(let shadow):
            return shadow.description
        case .multiple(let shadows):
            return shadows.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}
