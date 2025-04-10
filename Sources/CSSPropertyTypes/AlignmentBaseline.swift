import Foundation
import CSSTypeTypes

/// The CSS alignment-baseline property specifies the specific baseline used to align the box's text and inline-level contents.
///
/// Baseline alignment is the relationship among the baselines of multiple alignment subjects within an alignment context.
/// When performing baseline alignment, the alignment-baseline property value specifies which baseline of the box is
/// aligned to the corresponding baseline of its alignment context.
///
/// Note: The alignment-baseline property only has an effect on inline-level boxes, flex items, grid items, table cells,
/// and the `<text>`, `<textPath>`, and `<tspan>` SVG elements.
///
/// Example:
/// ```swift
/// .alignmentBaseline(.baseline)       // alignment-baseline: baseline
/// .alignmentBaseline(.alphabetic)     // alignment-baseline: alphabetic
/// .alignmentBaseline(.central)        // alignment-baseline: central
/// .alignmentBaseline(.textBottom)     // alignment-baseline: text-bottom
/// ```
///
/// - SeeAlso: [MDN Web Docs on alignment-baseline](https://developer.mozilla.org/en-US/docs/Web/CSS/alignment-baseline)
public enum AlignmentBaseline: Property {
    public static let property: String = "alignment-baseline"
    
    /// Use the dominant-baseline value of the parent
    case baseline
    
    /// Match the box's alphabetic baseline to that of its parent
    case alphabetic
    
    /// Match the box's central baseline to the central baseline of its parent
    case central
    
    /// Match the box's ideographic character face under-side baseline to that of its parent
    case ideographic
    
    /// Match the box's mathematical baseline to that of its parent
    case mathematical
    
    /// Align the vertical midpoint of the box with the baseline of the parent plus half the x-height
    case middle
    
    /// Match the bottom of the box to the top of the parent's content area
    case textBottom
    
    /// Match the top of the box to the top of the parent's content area
    case textTop
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // Deprecated values (included for completeness)
    
    /// Deprecated - Use the baseline value of the parent
    @available(*, deprecated, message: "Use 'baseline' instead")
    case auto
    
    /// Deprecated - Alias for text-top
    @available(*, deprecated, message: "Use 'textTop' instead")
    case beforeEdge
    
    /// Deprecated - Alias for text-bottom
    @available(*, deprecated, message: "Use 'textBottom' instead")
    case afterEdge
    
    /// Deprecated
    @available(*, deprecated, message: "This value is deprecated")
    case hanging
    
    /// Deprecated - Alias for text-top
    @available(*, deprecated, message: "Use 'textTop' instead")
    case textBeforeEdge
    
    /// Deprecated - Alias for text-bottom
    @available(*, deprecated, message: "Use 'textBottom' instead")
    case textAfterEdge
}

/// CSS Output conversion
extension AlignmentBaseline {
    /// Converts the alignment baseline to its CSS string representation
    public var description: String {
        switch self {
        case .baseline:
            return "baseline"
        case .alphabetic:
            return "alphabetic"
        case .central:
            return "central"
        case .ideographic:
            return "ideographic"
        case .mathematical:
            return "mathematical"
        case .middle:
            return "middle"
        case .textBottom:
            return "text-bottom"
        case .textTop:
            return "text-top"
        case .global(let global):
            return global.description
        case .auto:
            return "auto"
        case .beforeEdge:
            return "before-edge"
        case .afterEdge:
            return "after-edge"
        case .hanging:
            return "hanging"
        case .textBeforeEdge:
            return "text-before-edge"
        case .textAfterEdge:
            return "text-after-edge"
        }
    }
}
