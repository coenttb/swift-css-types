//
//  Rotate.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `rotate` property allows you to specify rotation transforms individually and
/// independently of the `transform` property.
///
/// This property provides a more intuitive way to apply rotations to elements
/// compared to using the `transform` property with rotation functions.
///
/// Example:
/// ```swift
/// .rotate(.none)                       // rotate: none
/// .rotate(.z(Angle.deg(45)))           // rotate: 45deg
/// .rotate(.axis(.x, Angle.deg(90)))    // rotate: x 90deg
/// .rotate(.axis(.y, Angle.turn(0.5)))  // rotate: y 0.5turn
/// .rotate(.vector(1, 1, 1, Angle.deg(180))) // rotate: 1 1 1 180deg
/// ```
///
/// - SeeAlso: [MDN Web Docs on rotate](https://developer.mozilla.org/en-US/docs/Web/CSS/rotate)
public enum Rotate: Property {
    public static let property: String = "rotate"
    
    /// No rotation is applied
    case none
    
    /// Rotation around the Z-axis (2D rotation)
    case z(Angle)
    
    /// Rotation around a specific axis (X, Y, or Z)
    case axis(Axis, Angle)
    
    /// Rotation around a specific vector and angle (3D rotation)
    case vector(Double, Double, Double, Angle)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    /// Represents a rotation axis
    public enum Axis: String, Sendable, Hashable {
        /// X-axis (horizontal)
        case x
        
        /// Y-axis (vertical)
        case y
        
        /// Z-axis (depth)
        case z
    }
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .z(let angle):
            return angle.description
        case .axis(let axis, let angle):
            return "\(axis.rawValue) \(angle.description)"
        case .vector(let x, let y, let z, let angle):
            return "\(x.truncatingRemainder()) \(y.truncatingRemainder()) \(z.truncatingRemainder()) \(angle.description)"
        case .global(let global):
            return global.description
        }
    }
}
