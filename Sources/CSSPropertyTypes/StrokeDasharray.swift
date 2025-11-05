//
//  StrokeDasharray.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `stroke-dasharray` property defines a pattern of dashes and gaps used in the painting
/// of an SVG shape's stroke. If present, it overrides the element's stroke-dasharray attribute.
///
/// This property applies to any SVG shape or text-content element, but as an inherited property,
/// it may be applied to elements such as `<g>` and still have the intended effect on descendant
/// elements' strokes.
///
/// Example:
/// ```swift
/// .strokeDasharray(.none)                   // stroke-dasharray: none
/// .strokeDasharray([2, 5])                  // stroke-dasharray: 2, 5
/// .strokeDasharray([.px(2), .px(5)])        // stroke-dasharray: 2px, 5px
/// .strokeDasharray([.percentage(20), .percentage(10)]) // stroke-dasharray: 20%, 10%
/// ```
///
/// - Note: If an odd number of values is given, the entire sequence is repeated to create a pattern
///         with an even number of values.
///
/// - SeeAlso: [MDN Web Docs on stroke-dasharray](https://developer.mozilla.org/en-US/docs/Web/CSS/stroke-dasharray)
public enum StrokeDasharray: Property {
    public static let property: String = "stroke-dasharray"

    /// Solid line with no dashes (default)
    case none

    /// Array of numeric values representing alternating dash and gap lengths in SVG units
    case numbers([Double])

    /// Array of length values representing alternating dash and gap lengths
    case lengths([Length])

    /// Array of percentage values representing alternating dash and gap lengths relative to the SVG viewport diagonal
    case percentages([Percentage])

    /// Array of length-percentage values representing alternating dash and gap lengths
    case lengthPercentages([LengthPercentage])

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    /// Creates a dash array from an array of Doubles (interpreted as SVG units)
    public init(_ values: [Double]) {
        self = .numbers(values)
    }

    /// Creates a dash array from an array of Lengths
    public init(_ values: [Length]) {
        self = .lengths(values)
    }

    /// Creates a dash array from an array of Percentages
    public init(_ values: [Percentage]) {
        self = .percentages(values)
    }

    /// Creates a dash array from an array of LengthPercentages
    public init(_ values: [LengthPercentage]) {
        self = .lengthPercentages(values)
    }

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .numbers(let values):
            return values.map { String(format: "%.5g", $0) }.joined(separator: ", ")
        case .lengths(let values):
            return values.map { $0.description }.joined(separator: ", ")
        case .percentages(let values):
            return values.map { $0.description }.joined(separator: ", ")
        case .lengthPercentages(let values):
            return values.map { $0.description }.joined(separator: ", ")
        case .global(let global):
            return global.description
        }
    }
}
