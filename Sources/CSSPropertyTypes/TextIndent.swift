//
//  TextIndent.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-indent` property sets the length of empty space (indentation) that is put
/// before lines of text in a block.
///
/// Horizontal spacing is with respect to the left (or right, for right-to-left layout)
/// edge of the containing block-level element's content box.
///
/// - SeeAlso: [MDN Web Docs on text-indent](https://developer.mozilla.org/en-US/docs/Web/CSS/text-indent)
public enum TextIndent: Property {
    public static let property: String = "text-indent"

    /// Specifies indentation with length and optional modifiers
    case indent(value: LengthPercentage, eachLine: Bool, hanging: Bool)

    /// Global value
    case global(CSSTypeTypes.Global)

    /// Creates a new text indent with specified parameters
    /// - Parameters:
    ///   - value: The indentation value as a length or percentage
    ///   - eachLine: Whether indentation affects each line after a forced line break
    ///   - hanging: Whether the indentation is inverted (all lines except first line are indented)
    public init(value: LengthPercentage, eachLine: Bool = false, hanging: Bool = false) {
        self = .indent(value: value, eachLine: eachLine, hanging: hanging)
    }

    public var description: String {
        switch self {
        case .indent(let value, let eachLine, let hanging):
            var result = value.description

            if hanging {
                result += " hanging"
            }

            if eachLine {
                result += " each-line"
            }

            return result
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common text-indent values
extension TextIndent {
    /// No indentation
    public static var zero: TextIndent {
        TextIndent(value: .px(0))
    }

    /// Indentation using em units
    public static func em(_ value: Double, eachLine: Bool = false, hanging: Bool = false) -> TextIndent {
        TextIndent(value: .em(value), eachLine: eachLine, hanging: hanging)
    }

    /// Indentation using pixels
    public static func px(_ value: Double, eachLine: Bool = false, hanging: Bool = false) -> TextIndent {
        TextIndent(value: .px(value), eachLine: eachLine, hanging: hanging)
    }

    /// Percentage indentation relative to the containing block width
    public static func percentage(_ value: Percentage, eachLine: Bool = false, hanging: Bool = false) -> TextIndent {
        TextIndent(value: .percentage(value), eachLine: eachLine, hanging: hanging)
    }

    /// Hanging indentation (indents all lines except the first)
    public static func hanging(_ value: LengthPercentage) -> TextIndent {
        TextIndent(value: value, hanging: true)
    }

    /// Indentation that applies to each new line after a forced break
    public static func eachLine(_ value: LengthPercentage) -> TextIndent {
        TextIndent(value: value, eachLine: true)
    }
}
