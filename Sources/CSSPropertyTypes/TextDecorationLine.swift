import Foundation
import CSSTypeTypes

public enum TextDecorationLine: Property {
    public static let property: String = "text-decoration-line"
    
    /// A single value
    case value(TextDecorationLineValue)
    
    /// Multiple values
    case values([TextDecorationLineValue])
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Sets the kind of decoration that is used on text in an element, such as an underline or overline.
///
/// The text-decoration-line CSS property sets the kind of decoration that is used on text in an element,
/// such as an underline or overline. Multiple decorations can be applied at once.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-line)
///
/// # Example
/// ```swift
/// let style = Text.textDecorationLine(.none)
/// let style = Text.textDecorationLine(.underline)
/// let style = Text.textDecorationLine(.overline)
/// let style = Text.textDecorationLine(.lineThrough)
/// let style = Text.textDecorationLine([.underline, .overline])
/// ```
///
/// # CSS Values
/// ```css
/// text-decoration-line: none;
/// text-decoration-line: underline;
/// text-decoration-line: overline;
/// text-decoration-line: line-through;
/// text-decoration-line: underline overline;
/// ```
public enum TextDecorationLineValue: Sendable, Equatable, CustomStringConvertible {
    /// Produces no text decoration.
    case none
    
    /// Each line of text has a decorative line beneath it.
    case underline
    
    /// Each line of text has a decorative line above it.
    case overline
    
    /// Each line of text has a decorative line going through its middle.
    case lineThrough
    
    /// The text blinks (alternates between visible and invisible).
    /// Note: This value is deprecated in favor of CSS animations.
    case blink
    
    /// Each line of text uses the user agents' method of highlighting spelling mistakes,
    /// which is a dotted red line in most browsers.
    case spellingError
    
    /// Each line of text uses the user agents' method of highlighting grammar mistakes,
    /// which is a dotted green line in most browsers.
    case grammarError
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .underline:
            return "underline"
        case .overline:
            return "overline"
        case .lineThrough:
            return "line-through"
        case .blink:
            return "blink"
        case .spellingError:
            return "spelling-error"
        case .grammarError:
            return "grammar-error"
        }
    }
}

extension TextDecorationLine: CustomStringConvertible {
    public var description: String {
        switch self {
        case .value(let value):
            return value.description
        case .values(let values):
            return values.map { $0.description }.joined(separator: " ")
        case .global(let global):
            return global.description
        }
    }
}
