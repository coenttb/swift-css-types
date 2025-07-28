//
//  MathShift.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `math-shift` property indicates whether superscripts inside MathML formulas
/// should be raised by a normal or compact shift.
///
/// This property affects how superscripts in mathematical formulas are positioned vertically.
/// In compact mode, superscripts are positioned slightly lower than in normal mode.
///
/// - Warning: This is an experimental property and may not be supported in all browsers.
///
/// - SeeAlso: [MDN Web Docs on math-shift](https://developer.mozilla.org/en-US/docs/Web/CSS/math-shift)
public enum MathShift: Property {
    public static let property: String = "math-shift"

    /// The initial value, indicates normal rendering. Superscripts in MathML formulas use
    /// the superscriptShiftUp parameter from the OpenType MATH table.
    case normal

    /// Indicates compact rendering. Superscripts in MathML formulas use the superscriptShiftUpCramped
    /// parameter from the OpenType MATH table, which is generally smaller.
    case compact

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .compact:
            return "compact"
        case .global(let global):
            return global.description
        }
    }
}
