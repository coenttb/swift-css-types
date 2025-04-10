import Foundation
import CSSTypeTypes

/// Represents the CSS `mask-border-slice` property, which divides a mask border image into regions
/// that form the components of an element's mask border.
///
/// This property specifies how to slice the source image into nine regions: four corners,
/// four edges, and a middle region. The nine regions are created by specifying four inward offsets
/// from the top, right, bottom, and left sides of the image.
///
/// Visual Reference:
/// ```
/// ┌───┬───────────────┬───┐
/// │ 1 │       5       │ 2 │
/// ├───┼───────────────┼───┤
/// │   │               │   │
/// │ 8 │       9       │ 6 │
/// │   │               │   │
/// ├───┼───────────────┼───┤
/// │ 4 │       7       │ 3 │
/// └───┴───────────────┴───┘
///
/// Regions:
/// 1-4: Corner regions
/// 5-8: Edge regions
/// 9: Middle region (used only if 'fill' is specified)
/// ```
///
/// Example:
/// ```swift
/// // Set the same slice value for all sides
/// .maskBorderSlice(.number(30))
///
/// // Set the same slice value for all sides with fill
/// .maskBorderSlice(.number(30), fill: true)
///
/// // Set different values for vertical and horizontal sides
/// .maskBorderSlice(.number(10), .percentage(30))
///
/// // Set different values for top, horizontal sides, and bottom
/// .maskBorderSlice(.number(30), .percentage(30), .number(45))
///
/// // Set different values for each side
/// .maskBorderSlice(.number(7), .number(12), .number(14), .number(5))
/// ```
///
/// - Note: The corner regions are always used as-is, while the edge regions
///         can be repeated, scaled, or otherwise modified to fit the element's dimensions.
///         The middle region is discarded by default but can be displayed like a
///         background mask when the 'fill' keyword is specified.
///
/// - SeeAlso: [MDN Web Docs on mask-border-slice](https://developer.mozilla.org/en-US/docs/Web/CSS/mask-border-slice)
public enum MaskBorderSlice: Property {
    public static let property: String = "mask-border-slice"
    
    /// Same slice value for all sides
    case all(SliceValue, fill: Bool)
    
    /// Different values for vertical (top/bottom) and horizontal (left/right) sides
    case vertical_horizontal(SliceValue, SliceValue, fill: Bool)
    
    /// Different values for top, horizontal (left/right), and bottom sides
    case top_horizontal_bottom(SliceValue, SliceValue, SliceValue, fill: Bool)
    
    /// Different values for each side (top, right, bottom, left)
    case top_right_bottom_left(SliceValue, SliceValue, SliceValue, SliceValue, fill: Bool)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Slice value type
    public enum SliceValue: Sendable, Equatable, CustomStringConvertible {
        /// Number value (in pixels for raster images, coordinates for vector images)
        case number(Number)
        
        /// Percentage value relative to the source image's size
        case percentage(Percentage)
        
        /// String representation of the slice value
        public var description: String {
            switch self {
            case .number(let number):
                return number.description
            case .percentage(let percentage):
                return percentage.description
            }
        }
    }
    
    /// Creates a mask-border-slice with the same value for all sides
    ///
    /// - Parameters:
    ///   - value: The slice value for all sides
    ///   - fill: Whether to display the middle region
    public init(_ value: SliceValue, fill: Bool = false) {
        self = .all(value, fill: fill)
    }
    
    /// Creates a mask-border-slice with different values for vertical and horizontal sides
    ///
    /// - Parameters:
    ///   - vertical: The slice value for top and bottom sides
    ///   - horizontal: The slice value for left and right sides
    ///   - fill: Whether to display the middle region
    public init(_ vertical: SliceValue, _ horizontal: SliceValue, fill: Bool = false) {
        self = .vertical_horizontal(vertical, horizontal, fill: fill)
    }
    
    /// Creates a mask-border-slice with different values for top, horizontal sides, and bottom
    ///
    /// - Parameters:
    ///   - top: The slice value for the top side
    ///   - horizontal: The slice value for the left and right sides
    ///   - bottom: The slice value for the bottom side
    ///   - fill: Whether to display the middle region
    public init(_ top: SliceValue, _ horizontal: SliceValue, _ bottom: SliceValue, fill: Bool = false) {
        self = .top_horizontal_bottom(top, horizontal, bottom, fill: fill)
    }
    
    /// Creates a mask-border-slice with different values for each side
    ///
    /// - Parameters:
    ///   - top: The slice value for the top side
    ///   - right: The slice value for the right side
    ///   - bottom: The slice value for the bottom side
    ///   - left: The slice value for the left side
    ///   - fill: Whether to display the middle region
    public init(_ top: SliceValue, _ right: SliceValue, _ bottom: SliceValue, _ left: SliceValue, fill: Bool = false) {
        self = .top_right_bottom_left(top, right, bottom, left, fill: fill)
    }
    
    /// Creates a mask-border-slice with a number value for all sides
    ///
    /// - Parameters:
    ///   - value: The number value
    ///   - fill: Whether to display the middle region
    /// - Returns: A mask-border-slice with the number value
    public static func number(_ number: Number, fill: Bool = false) -> MaskBorderSlice {
        return MaskBorderSlice(.number(number), fill: fill)
    }
    
    /// Creates a mask-border-slice with a percentage value for all sides
    ///
    /// - Parameters:
    ///   - value: The percentage value
    ///   - fill: Whether to display the middle region
    /// - Returns: A mask-border-slice with the percentage value
    public static func percentage(_ value: Percentage, fill: Bool = false) -> MaskBorderSlice {
        return MaskBorderSlice(.percentage(value), fill: fill)
    }
    
    /// Default value (0)
    public static let `default` = MaskBorderSlice(.number(0))
}

/// Provides string conversion for CSS output
extension MaskBorderSlice: CustomStringConvertible {
    /// Converts the mask-border-slice to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// mask-border-slice: 30;
    /// mask-border-slice: 30 fill;
    /// mask-border-slice: 10% 30%;
    /// mask-border-slice: 30 30% 45 fill;
    /// mask-border-slice: 7 12 14 5;
    /// ```
    public var description: String {
        switch self {
        case .all(let value, let fill):
            return combineWithFill(value.description, fill)
        case .vertical_horizontal(let vertical, let horizontal, let fill):
            let values = "\(vertical.description) \(horizontal.description)"
            return combineWithFill(values, fill)
        case .top_horizontal_bottom(let top, let horizontal, let bottom, let fill):
            let values = "\(top.description) \(horizontal.description) \(bottom.description)"
            return combineWithFill(values, fill)
        case .top_right_bottom_left(let top, let right, let bottom, let left, let fill):
            let values = "\(top.description) \(right.description) \(bottom.description) \(left.description)"
            return combineWithFill(values, fill)
        case .global(let global):
            return global.description
        }
    }
    
    /// Helper method to add the 'fill' keyword if needed
    private func combineWithFill(_ values: String, _ fill: Bool) -> String {
        return fill ? "\(values) fill" : values
    }
}
