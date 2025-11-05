//
//  Translate.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `translate` property allows you to specify translation transforms individually and
/// independently of the `transform` property.
///
/// This maps better to typical user interface usage, and saves having to remember the exact order
/// of transform functions to specify in the transform value.
///
/// - SeeAlso: [MDN Web Docs on translate](https://developer.mozilla.org/en-US/docs/Web/CSS/translate)
public enum Translate: Property {

    public static let property: String = "translate"

    /// Specifies that no translation should be applied.
    case none

    /// Specifies a translation along the X-axis only.
    /// Equivalent to a `translate()` (2D translation) function with a single value specified.
    case x(LengthPercentage)

    /// Specifies X and Y axis translation values for a 2D translation.
    /// Equivalent to a `translate()` (2D translation) function with two values specified.
    case xy(x: LengthPercentage, y: LengthPercentage)

    /// Specifies X, Y, and Z axis translation values for a 3D translation.
    /// Equivalent to a `translate3d()` (3D translation) function.
    case xyz(x: LengthPercentage, y: LengthPercentage, z: Length)

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .x(let x):
            return x.description
        case .xy(let x, let y):
            return "\(x.description) \(y.description)"
        case .xyz(let x, let y, let z):
            return "\(x.description) \(y.description) \(z.description)"
        case .global(let global):
            return global.description
        }
    }
}
