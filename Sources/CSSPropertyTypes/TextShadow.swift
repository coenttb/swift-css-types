import CSSTypeTypes
import Foundation

/// The CSS `text-shadow` property adds shadows to text. It accepts a comma-separated list of shadows 
/// to be applied to the text and any of its decorations. Each shadow is described by some combination 
/// of X and Y offsets from the element, blur radius, and color.
///
/// Example:
/// ```swift
/// .textShadow(.shadow(offsetX: 1, offsetY: 1, blurRadius: 2, color: .named(.pink)))
/// .textShadow(.shadow(offsetX: 1, offsetY: 0, blurRadius: 10, color: .hex("#fc0")))
/// .textShadow(.shadow(offsetX: 5, offsetY: 5, color: .hex("#558abb")))
/// .textShadow(.shadow(offsetX: 2, offsetY: 5, color: .named(.red)))
/// .textShadow(.shadow(offsetX: 5, offsetY: 10))
/// .textShadow([
///   .shadow(offsetX: 1, offsetY: 1, blurRadius: 2, color: .named(.red)),
///   .shadow(offsetX: 0, offsetY: 0, blurRadius: 1, unit: .em, color: .named(.blue)),
///   .shadow(offsetX: 0, offsetY: 0, blurRadius: 0.2, unit: .em, color: .named(.blue))
/// ])
/// ```
///
/// When more than one shadow is given, shadows are applied front-to-back, with the first-specified 
/// shadow on top.
///
/// - SeeAlso: [MDN Web Docs on text-shadow](https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow)
public enum TextShadow: Property {
    public static let property: String = "text-shadow"

    /// No shadow (default)
    case none

    /// A single shadow
    case shadow(TextShadowValue)

    /// Multiple shadows
    case shadows([TextShadowValue])

    /// Global values
    case global(CSSTypeTypes.Global)

    /// Initialize with a single shadow
    public init(_ shadow: TextShadowValue) {
        self = .shadow(shadow)
    }

    /// Initialize with multiple shadows
    public init(_ shadows: [TextShadowValue]) {
        if shadows.isEmpty {
            self = .none
        } else if shadows.count == 1 {
            self = .shadow(shadows[0])
        } else {
            self = .shadows(shadows)
        }
    }

    /// Initialize with multiple shadows
    public init(_ shadows: TextShadowValue...) {
        self.init(shadows)
    }

    /// A convenience factory method for creating a shadow with pixel values
    public static func shadow(
        offsetX: Double,
        offsetY: Double,
        blurRadius: Double? = nil,
        color: Color? = nil
    ) -> TextShadow {
        .shadow(TextShadowValue(
            offsetX: .px(offsetX),
            offsetY: .px(offsetY),
            blurRadius: blurRadius.map { .px($0) },
            color: color
        ))
    }

//    /// A convenience factory method for creating a shadow with a specific unit
//    public static func shadow(
//        offsetX: Double,
//        offsetY: Double,
//        blurRadius: Double? = nil,
//        unit: Length.Unit,
//        color: Color? = nil
//    ) -> TextShadow {
//        .shadow(TextShadowValue(
//            offsetX: .init(offsetX, unit),
//            offsetY: .init(offsetY, unit),
//            blurRadius: blurRadius.map { .init($0, unit) },
//            color: color
//        ))
//    }
}

/// Represents a single text shadow value
public struct TextShadowValue: Sendable, Hashable {
    /// The horizontal offset of the shadow
    public var offsetX: Length

    /// The vertical offset of the shadow
    public var offsetY: Length

    /// The blur radius (optional)
    public var blurRadius: Length?

    /// The color of the shadow (optional)
    public var color: Color?

    /// Initialize a text shadow value
    public init(offsetX: Length, offsetY: Length, blurRadius: Length? = nil, color: Color? = nil) {
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.color = color
    }
}

/// CSS Output conversion
extension TextShadowValue: CustomStringConvertible {
    /// Converts the text shadow value to its CSS string representation
    public var description: String {
        var result = ""

        // Color can be specified before or after the offset values
        // For consistency, we'll always put it at the end

        result += "\(offsetX) \(offsetY)"

        if let blurRadius = blurRadius {
            result += " \(blurRadius)"
        }

        if let color = color {
            result += " \(color)"
        }

        return result
    }
}

/// CSS Output conversion
extension TextShadow: CustomStringConvertible {
    /// Converts the text-shadow value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .shadow(let shadow):
            return shadow.description

        case .shadows(let shadows):
            return shadows.map { $0.description }.joined(separator: ", ")

        case .global(let global):
            return global.description
        }
    }
}
