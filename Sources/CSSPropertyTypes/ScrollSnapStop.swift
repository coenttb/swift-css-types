//
// ScrollSnapStop.swift

import CSSTypeTypes

/// The `scroll-snap-stop` CSS property defines whether the scroll container is allowed to "pass over"
/// possible snap positions.
///
/// ```css
/// scroll-snap-stop: normal;
/// scroll-snap-stop: always;
/// ```
public enum ScrollSnapStop: Property {
    public static let property: String = "scroll-snap-stop"

    /// When the visual viewport is scrolled, it may "pass over" possible snap positions
    case normal

    /// The scroll container must not "pass over" a possible snap position and must snap to the first snap position
    case always

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal: return "normal"
        case .always: return "always"
        case .global(let global): return global.description
        }
    }
}
