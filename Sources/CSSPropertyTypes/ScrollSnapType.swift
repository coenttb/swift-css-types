//
// ScrollSnapType.swift

import CSSTypeTypes

/// The `scroll-snap-type` CSS property sets the strictness of snap points in the scroll container in both
/// horizontal and vertical directions. It is set on a scroll container, opting it into scroll snapping by
/// setting the direction and strictness of snap point enforcement within the snap port.
///
/// ```css
/// scroll-snap-type: none;
/// scroll-snap-type: x;
/// scroll-snap-type: y;
/// scroll-snap-type: x mandatory;
/// scroll-snap-type: both proximity;
/// ```
public enum ScrollSnapType: Property {
    public static let property: String = "scroll-snap-type"

    /// The axis along which snapping occurs
    public enum Axis: String, Sendable {
        /// Horizontal axis
        case x

        /// Vertical axis
        case y

        /// Block axis
        case block

        /// Inline axis
        case inline

        /// Both axes independently
        case both
    }

    /// The strictness of snap point enforcement
    public enum Strictness: String, Sendable {
        /// The scroll container must snap to a snap position
        case mandatory

        /// The scroll container may snap to a snap position based on scroll parameters
        case proximity
    }

    /// No snap points
    case none

    /// Snap points along a specified axis with default proximity strictness
    case axis(Axis)

    /// Snap points along a specified axis with specified strictness
    case axisWithStrictness(Axis, Strictness)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .axis(let axis):
            return axis.rawValue
        case .axisWithStrictness(let axis, let strictness):
            return "\(axis.rawValue) \(strictness.rawValue)"
        case .global(let global):
            return global.description
        }
    }

    /// Creates a ScrollSnapType with a specific axis and strictness
    /// - Parameters:
    ///   - axis: The axis for snapping
    ///   - strictness: The strictness of snap point enforcement
    /// - Returns: A ScrollSnapType with the specified axis and strictness
    public static func axis(_ axis: Axis, strictness: Strictness) -> Self {
        .axisWithStrictness(axis, strictness)
    }

    /// Shorthand for x axis with mandatory strictness
    public static let xMandatory: Self = .axisWithStrictness(.x, .mandatory)

    /// Shorthand for y axis with mandatory strictness
    public static let yMandatory: Self = .axisWithStrictness(.y, .mandatory)

    /// Shorthand for x axis with proximity strictness
    public static let xProximity: Self = .axisWithStrictness(.x, .proximity)

    /// Shorthand for y axis with proximity strictness
    public static let yProximity: Self = .axisWithStrictness(.y, .proximity)

    /// Shorthand for both axes with mandatory strictness
    public static let bothMandatory: Self = .axisWithStrictness(.both, .mandatory)

    /// Shorthand for both axes with proximity strictness
    public static let bothProximity: Self = .axisWithStrictness(.both, .proximity)
}
