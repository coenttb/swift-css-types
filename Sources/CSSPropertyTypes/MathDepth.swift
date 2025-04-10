//
//  MathDepth.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `math-depth` property describes a notion of depth for each element of a mathematical formula,
/// with respect to the top-level container of that formula.
///
/// This is used to scale the computed value of the font-size of elements when `font-size: math` is applied.
/// Font-size: math is the default for MathML <math> elements in the MathML Core User Agent Stylesheet.
///
/// - SeeAlso: [MDN Web Docs on math-depth](https://developer.mozilla.org/en-US/docs/Web/CSS/math-depth)
public enum MathDepth: Property {
    public static let property: String = "math-depth"
    
    /// Set to the inherited math-depth plus 1 when inherited math-style is compact.
    case autoAdd
    
    /// Set to the inherited math-depth plus the specified integer.
    case add(Int)
    
    /// Set to the specified integer.
    case absolute(Int)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .autoAdd:
            return "auto-add"
        case .add(let value):
            return "add(\(value))"
        case .absolute(let value):
            return "\(value)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common math depth values
extension MathDepth {
    /// Set math depth to 0 (root level)
    public static var zero: MathDepth {
        .absolute(0)
    }
    
    /// Increase math depth by 1 (go one level deeper)
    public static var increaseByOne: MathDepth {
        .add(1)
    }
    
    /// Decrease math depth by 1 (go one level up)
    public static var decreaseByOne: MathDepth {
        .add(-1)
    }
}
