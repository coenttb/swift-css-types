import CSSTypeTypes
import Foundation

/// Customizes the width of tab characters (U+0009).
///
/// The tab-size CSS property is used to customize the width of tab characters (U+0009).
/// It can be specified either as a number of spaces or as a specific length.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/tab-size)
///
/// # Example
/// ```swift
/// let style = Text.tabSize(.number(4))
/// let style = Text.tabSize(.length(.px(16)))
/// let style = Text.tabSize(.length(.em(2)))
/// ```
///
/// # CSS Values
/// ```css
/// tab-size: 4;
/// tab-size: 16px;
/// tab-size: 2em;
/// ```
public enum TabSize: Property, LengthConvertible {
    public static let property: String = "tab-size"
    /// Specify tab width as a number of spaces
    case number(Int)

    /// Specify tab width as a specific length
    case length(Length)

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TabSize: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .number(value)
    }
}

extension TabSize: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let number):
            return number.description
        case .length(let length):
            return length.description
        case .global(let global):
            return global.description
        }
    }
}
