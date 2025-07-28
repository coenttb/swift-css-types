import CSSTypeTypes
import Foundation

/// Represents a CSS @position-try at-rule.
///
/// The @position-try at-rule is used to define custom position fallback options
/// for anchor-positioned elements. These fallback positions are applied when an
/// anchored element would otherwise overflow its containing block or the viewport.
///
/// Examples:
/// ```swift
/// // Basic position try rule
/// PositionTry.named("--custom-left")
///     .positionArea(.left)
///     .width(.px(100))
///     .margin(.px(0), .px(10), .px(0), .px(0))
///
/// // Position try with alignment
/// PositionTry.named("--custom-bottom")
///     .top(.anchor("bottom"))
///     .justifySelf(.anchorCenter)
///     .margin(.px(10), .px(0), .px(0), .px(0))
///     .positionArea(.none)
///
/// // Position try with calculation
/// PositionTry.named("--custom-right")
///     .left(.calc("anchor(right) + 10px"))
///     .alignSelf(.anchorCenter)
///     .width(.px(100))
///     .positionArea(.none)
/// ```
public struct PositionTry: AtRule {
    public static let identifier: String = "position-try"

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a new @position-try rule with the specified custom identifier
    /// @position-try --name {}
    public static func named(_ name: String) -> PositionTry {
        PositionTry(rawValue: "@position-try \(name) {}")
    }

    /// Sets the position-anchor property in the position try rule
    /// @position-try --name { position-anchor: <value>; }
    public func positionAnchor(_ value: String) -> PositionTry {
        addProperty("position-anchor: \(value);")
    }

    /// Sets the position-area property in the position try rule
    /// @position-try --name { position-area: <value>; }
    public func positionArea(_ value: PositionArea) -> PositionTry {
        addProperty("position-area: \(value);")
    }

    /// Sets position-area to "none" to disable it
    /// @position-try --name { position-area: none; }
    public func positionArea(_ value: PositionAreaValue) -> PositionTry {
        addProperty("position-area: \(value.rawValue);")
    }

    /// Sets the top property in the position try rule
    /// @position-try --name { top: <value>; }
    public func top(_ value: AnchorValue) -> PositionTry {
        addProperty("top: \(value.rawValue);")
    }

    /// Sets the right property in the position try rule
    /// @position-try --name { right: <value>; }
    public func right(_ value: AnchorValue) -> PositionTry {
        addProperty("right: \(value.rawValue);")
    }

    /// Sets the bottom property in the position try rule
    /// @position-try --name { bottom: <value>; }
    public func bottom(_ value: AnchorValue) -> PositionTry {
        addProperty("bottom: \(value.rawValue);")
    }

    /// Sets the left property in the position try rule
    /// @position-try --name { left: <value>; }
    public func left(_ value: AnchorValue) -> PositionTry {
        addProperty("left: \(value.rawValue);")
    }

    /// Sets the inset property in the position try rule
    /// @position-try --name { inset: <value>; }
    public func inset(_ value: AnchorValue) -> PositionTry {
        addProperty("inset: \(value.rawValue);")
    }

    /// Sets the width property in the position try rule
    /// @position-try --name { width: <value>; }
    public func width(_ value: LengthPercentage) -> PositionTry {
        addProperty("width: \(value);")
    }

    /// Sets the height property in the position try rule
    /// @position-try --name { height: <value>; }
    public func height(_ value: LengthPercentage) -> PositionTry {
        addProperty("height: \(value);")
    }

    /// Sets the margin property in the position try rule with a single value
    /// @position-try --name { margin: <value>; }
    public func margin(_ value: LengthPercentage) -> PositionTry {
        addProperty("margin: \(value);")
    }

    /// Sets the margin property in the position try rule with four values
    /// @position-try --name { margin: <top> <right> <bottom> <left>; }
    public func margin(_ top: LengthPercentage, _ right: LengthPercentage, _ bottom: LengthPercentage, _ left: LengthPercentage) -> PositionTry {
        addProperty("margin: \(top) \(right) \(bottom) \(left);")
    }

    /// Sets the align-self property in the position try rule
    /// @position-try --name { align-self: <value>; }
    public func alignSelf(_ value: SelfAlignment) -> PositionTry {
        addProperty("align-self: \(value.rawValue);")
    }

    /// Sets the justify-self property in the position try rule
    /// @position-try --name { justify-self: <value>; }
    public func justifySelf(_ value: SelfAlignment) -> PositionTry {
        addProperty("justify-self: \(value.rawValue);")
    }

    /// Helper method to add a CSS property to the position try rule
    private func addProperty(_ property: String) -> PositionTry {
        let currentContent = rawValue

        // Check if the rule already has properties
        if currentContent.hasSuffix("{}") {
            // No properties yet, add the first one
            let newContent = currentContent.dropLast() + property + "}"
            return PositionTry(rawValue: String(newContent))
        } else {
            // Already has properties, add another one
            let newContent = currentContent.dropLast() + " " + property + "}"
            return PositionTry(rawValue: String(newContent))
        }
    }
}

extension PositionTry {
    /// Special position-area values
    public enum PositionAreaValue: String, Hashable, Sendable {
        /// Disables the position-area property
        case none
    }

    /// Anchor function values for inset properties
    public enum AnchorValue: Hashable, Sendable {
        /// Value using the anchor() function
        case anchor(String)

        /// Value using a calc() function
        case calc(String)

        /// The raw CSS representation
        public var rawValue: String {
            switch self {
            case .anchor(let edge):
                return "anchor(\(edge))"
            case .calc(let expression):
                return "calc(\(expression))"
            }
        }
    }

    /// Self-alignment values for anchor positioning
    public enum SelfAlignment: String, Hashable, Sendable {
        /// Standard CSS alignment values
        case auto
        case normal
        case start
        case end
        case center
        case selfStart = "self-start"
        case selfEnd = "self-end"
        case flexStart = "flex-start"
        case flexEnd = "flex-end"

        /// Anchor-specific alignment value
        case anchorCenter = "anchor-center"
    }
}
