//
// ScrollSnapAlign.swift

import CSSTypeTypes

/// The `scroll-snap-align` CSS property specifies the box's snap position as an alignment of its snap area
/// (as the alignment subject) within its snap container's snap port (as the alignment container).
///
/// One or two values can be specified for this property. If one value is set, it is applied to both the block
/// and inline axes. If two values are set, the first value controls the block axis and the second value controls
/// the inline axis.
///
/// ```css
/// scroll-snap-align: none;
/// scroll-snap-align: start;
/// scroll-snap-align: end;
/// scroll-snap-align: center;
/// scroll-snap-align: start end;
/// ```
public enum ScrollSnapAlign: Property {
    public static let property: String = "scroll-snap-align"

    /// The alignment value for both block and inline axes
    public enum Alignment: String, Sendable {
        /// The box does not define a snap position in that axis
        case none

        /// The start alignment of this box's scroll snap area is a snap position in this axis
        case start

        /// The end alignment of this box's scroll snap area is a snap position in this axis
        case end

        /// The center alignment of this box's scroll snap area is a snap position in this axis
        case center
    }

    /// A single alignment value for both block and inline axes
    case single(Alignment)

    /// Two alignment values, first for block axis, second for inline axis
    case blockInline(Alignment, Alignment)

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .single(let alignment):
            return alignment.rawValue
        case .blockInline(let block, let inline):
            return "\(block.rawValue) \(inline.rawValue)"
        case .global(let global):
            return global.description
        }
    }

    /// No snap position is defined in either axis
    public static let none: Self = .single(.none)

    /// The start alignment is a snap position in both axes
    public static let start: Self = .single(.start)

    /// The end alignment is a snap position in both axes
    public static let end: Self = .single(.end)

    /// The center alignment is a snap position in both axes
    public static let center: Self = .single(.center)

    /// Creates a ScrollSnapAlign with different alignments for block and inline axes
    /// - Parameters:
    ///   - block: The alignment for the block axis
    ///   - inline: The alignment for the inline axis
    /// - Returns: A ScrollSnapAlign with the specified alignments
    public static func blockInline(block: Alignment, inline: Alignment) -> Self {
        .blockInline(block, inline)
    }
}
