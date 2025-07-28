import CSSTypeTypes
import Foundation

/// Represents the CSS `background-origin` property, which sets the background's origin point.
///
/// This property determines the origin point for positioning the background image: from the border start,
/// inside the border, or inside the padding. It affects where the background-position is calculated from.
///
/// Visual Reference:
/// ```
/// ┌─────────────────────────────┐
/// │         border-box          │
/// │   ┌───────────────────┐     │
/// │   │   padding-box     │     │
/// │   │  ┌─────────────┐  │     │
/// │   │  │ content-box │  │     │
/// │   │  │             │  │     │
/// │   │  └─────────────┘  │     │
/// │   └───────────────────┘     │
/// └─────────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Position background relative to the padding box (default)
/// .backgroundOrigin(.paddingBox)
///
/// // Position background relative to the border box
/// .backgroundOrigin(.borderBox)
///
/// // Position background relative to the content box
/// .backgroundOrigin(.contentBox)
///
/// // Different origins for multiple backgrounds
/// .backgroundOrigin(.values(.contentBox, .paddingBox))
/// ```
///
/// - Note: This property is ignored when background-attachment is fixed.
///
/// - SeeAlso: [MDN Web Docs on background-origin](https://developer.mozilla.org/en-US/docs/Web/CSS/background-origin)
public enum BackgroundOrigin: Property {

    public static let property: String = "background-origin"

    /// The background is positioned relative to the border box
    case borderBox

    /// The background is positioned relative to the padding box (default)
    case paddingBox

    /// The background is positioned relative to the content box
    case contentBox

    /// Multiple origin values for multiple backgrounds
    case multiple([BackgroundOrigin])

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BackgroundOrigin: CustomStringConvertible {
    /// Converts the background-origin value to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// background-origin: padding-box;
    /// background-origin: border-box;
    /// background-origin: content-box;
    /// background-origin: content-box, padding-box;
    /// ```
    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"
        case .paddingBox:
            return "padding-box"
        case .contentBox:
            return "content-box"
        case .multiple(let origins):
            return origins.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}

/// Default value and convenience methods
extension BackgroundOrigin {
    /// The default value for background-origin (`padding-box`)
    public static let `default` = BackgroundOrigin.paddingBox

    /// Creates a background-origin with multiple values
    ///
    /// - Parameter origins: The background origin values
    /// - Returns: A background-origin with multiple values
    public static func values(_ origins: [BackgroundOrigin]) -> BackgroundOrigin {
        if origins.count == 1, case let origin = origins[0] {
            return origin
        }
        return .multiple(origins)
    }

    /// Creates a background-origin with multiple values
    ///
    /// - Parameter origins: The background origin values
    /// - Returns: A background-origin with multiple values
    public static func values(_ origins: BackgroundOrigin...) -> BackgroundOrigin {
        values(origins)
    }
}
