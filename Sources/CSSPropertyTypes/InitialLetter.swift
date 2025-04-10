//
//  InitialLetter.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import Foundation
import CSSTypeTypes

/// The CSS `initial-letter` property sets the size and sink for dropped, raised,
/// and sunken initial letters.
///
/// This property applies to `::first-letter` pseudo-elements and inline-level
/// first children of block containers. It's commonly used to create drop caps
/// and similar typographic treatments.
///
/// - SeeAlso: [MDN Web Docs on initial-letter](https://developer.mozilla.org/en-US/docs/Web/CSS/initial-letter)
public enum InitialLetter: Property {
    
    public static let property: String = "initial-letter"
    
    /// No special initial-letter effect. Text behaves as normal.
    case normal
    
    /// Defines the size of the initial letter (in number of lines) and optionally the sink value.
    /// If the sink value is omitted, it is the same as the size, floored to the nearest positive integer.
    case sized(size: Double, sink: Int?)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .sized(let size, let sink):
            if let sink = sink {
                return "\(size) \(sink)"
            }
            return "\(size)"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for common initial letter values
extension InitialLetter {
    /// Create a dropped initial letter with the specified size.
    /// The initial letter will be sized to occupy the given number of lines,
    /// and will sink to align with the baseline of the bottom line it covers.
    ///
    /// - Parameter size: The number of lines the initial letter should occupy
    /// - Returns: An InitialLetter configured for a dropped initial
    public static func drop(size: Double) -> InitialLetter {
        .sized(size: size, sink: nil)
    }
    
    /// Create a raised initial letter with the specified size and sink.
    /// The initial letter will be sized to occupy the given number of lines,
    /// but with a baseline position specified by the sink parameter.
    ///
    /// - Parameters:
    ///   - size: The number of lines the initial letter should occupy
    ///   - sink: The number of lines the initial letter should sink (1 = no sinking)
    /// - Returns: An InitialLetter configured for a raised or partially sunken initial
    public static func raised(size: Double, sink: Int) -> InitialLetter {
        .sized(size: size, sink: sink)
    }
}
