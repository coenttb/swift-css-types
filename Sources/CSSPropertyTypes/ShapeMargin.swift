//
// ShapeMargin.swift

import CSSTypeTypes

/// The `shape-margin` CSS property sets a margin for a CSS shape created using `shape-outside`.
/// The margin lets you adjust the distance between the edges of the shape (the float element)
/// and the surrounding content.
///
/// ```css
/// shape-margin: 10px;
/// shape-margin: 20mm;
/// shape-margin: 60%;
/// ```
public enum ShapeMargin: Property, LengthPercentageConvertible, CustomStringConvertible {
    public static let property: String = "shape-margin"

    case lengthPercentage(LengthPercentage)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .global(let global):
            return global.description
        }
    }
}
