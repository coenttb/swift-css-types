import CSSTypeTypes
import Foundation

/// The CSS `column-width` property sets the ideal column width in a multi-column layout.
/// The container will have as many columns as can fit without any of them having a width less than the column-width value.
/// If the width of the container is narrower than the specified value, the single column's width will be smaller than
/// the declared column width.
///
/// Example:
/// ```swift
/// .columnWidth(.auto)     // column-width: auto
/// .columnWidth(.px(60))   // column-width: 60px
/// .columnWidth(.em(15.5)) // column-width: 15.5em
/// .columnWidth(.vw(3.3))  // column-width: 3.3vw
/// ```
///
/// This property can help create responsive designs that fit different screen sizes. When used with the
/// `column-count` property (which has precedence), you must specify all related length values to achieve
/// an exact column width.
///
/// - SeeAlso: [MDN Web Docs on column-width](https://developer.mozilla.org/en-US/docs/Web/CSS/column-width)
public enum ColumnWidth: Property, LengthConvertible {
    public static let property: String = "column-width"
    /// The width of the column is determined by other CSS properties, such as column-count
    case auto

    /// A specific length for the column width
    case length(Length)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ColumnWidth: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .length(let length):
            return length.description

        case .global(let global):
            return global.description
        }
    }
}
