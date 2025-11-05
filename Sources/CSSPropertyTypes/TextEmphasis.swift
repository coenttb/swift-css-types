//
//  TextEmphasis.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-emphasis` property applies emphasis marks to text (except spaces and control characters).
///
/// It is a shorthand for `text-emphasis-style` and `text-emphasis-color`.
///
/// The text-emphasis property is quite different from text-decoration. The text-decoration property
/// does not inherit, and the decoration specified is applied across the whole element. However,
/// text-emphasis does inherit, which means it is possible to change emphasis marks for descendants.
///
/// - Note: The size of the emphasis symbol, like ruby symbols, is about 50% of the size of the font,
///         and text-emphasis may affect line height when the current leading is not enough for the marks.
///
/// - Note: text-emphasis doesn't reset the value of text-emphasis-position. This is because if the style
///         and the color of emphasis marks may vary in a text, it is extremely unlikely that their position will.
///
/// - SeeAlso: [MDN Web Docs on text-emphasis](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis)
public enum TextEmphasis: Property {
    public static let property: String = "text-emphasis"

    /// Emphasis configuration with style and optional color
    case config(Configuration)

    /// Global CSS values
    case global(CSSTypeTypes.Global)

    /// Creates a new text emphasis with style and optional color
    /// - Parameters:
    ///   - style: The style of the emphasis marks
    ///   - color: The color of the emphasis marks (optional)
    public init(style: TextEmphasisStyle, color: TextEmphasisColor? = nil) {
        if case .global(let global) = style {
            self = .global(global)
        } else {
            self = .config(Configuration(style: style, color: color))
        }
    }

    /// Creates a new text emphasis with specified shape, fill, and optional color
    /// - Parameters:
    ///   - shape: The shape to use for the emphasis marks
    ///   - fill: The fill style to use for the emphasis marks
    ///   - color: The color of the emphasis marks (optional)
    public init(shape: EmphasisShape, fill: EmphasisFill = .filled, color: TextEmphasisColor? = nil)
    {
        self = .config(Configuration(style: .shape(shape, fill), color: color))
    }

    /// Creates a new text emphasis with a string character and optional color
    /// - Parameters:
    ///   - string: The string character to use as the emphasis mark
    ///   - color: The color of the emphasis marks (optional)
    public init(string: CSSString, color: TextEmphasisColor? = nil) {
        self = .config(Configuration(style: .string(string), color: color))
    }

    /// Configuration for a text emphasis
    public struct Configuration: Sendable, Hashable, CustomStringConvertible {
        /// The style of the emphasis marks
        public let style: TextEmphasisStyle

        /// The color of the emphasis marks
        public let color: TextEmphasisColor?

        /// Creates a new text emphasis configuration with style and optional color
        /// - Parameters:
        ///   - style: The style of the emphasis marks
        ///   - color: The color of the emphasis marks (optional)
        public init(style: TextEmphasisStyle, color: TextEmphasisColor? = nil) {
            self.style = style
            self.color = color
        }

        /// CSS string representation
        public var description: String {
            if let color = color {
                return "\(style) \(color)"
            }

            return style.description
        }
    }
}

/// Provides string conversion for CSS output
extension TextEmphasis: CustomStringConvertible {
    /// Converts the text-emphasis to its CSS string representation
    public var description: String {
        switch self {
        case .config(let config):
            return config.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factories for common emphasis values
extension TextEmphasis {
    /// No emphasis marks
    public static var none: TextEmphasis {
        .config(Configuration(style: .none))
    }

    /// Filled dot emphasis with optional color
    public static func filledDot(color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .filledDot, color: color))
    }

    /// Filled circle emphasis with optional color
    public static func filledCircle(color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .filledCircle, color: color))
    }

    /// Filled triangle emphasis with optional color
    public static func filledTriangle(color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .filledTriangle, color: color))
    }

    /// Single character emphasis with optional color
    public static func character(_ char: String, color: TextEmphasisColor? = nil) -> TextEmphasis {
        .config(Configuration(style: .string(.init(char)), color: color))
    }
}
