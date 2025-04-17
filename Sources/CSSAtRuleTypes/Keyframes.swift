import Foundation
import CSSTypeTypes

/// Represents a CSS @keyframes at-rule.
///
/// The @keyframes CSS at-rule controls the intermediate steps in a CSS animation
/// sequence by defining styles for keyframes (or waypoints) along the animation sequence.
///
/// Examples:
/// ```swift
/// // Simple slide-in animation
/// Keyframes("slide-in")
///     .keyframe(.from, [
///         "transform": "translateX(0%)"
///     ])
///     .keyframe(.to, [
///         "transform": "translateX(100%)"
///     ])
///
/// // Fade animation with multiple keyframes
/// Keyframes("fade-in-out")
///     .keyframe(.percentage(0), [
///         "opacity": "0"
///     ])
///     .keyframe(.percentage(50), [
///         "opacity": "1"
///     ])
///     .keyframe(.percentage(100), [
///         "opacity": "0"
///     ])
///
/// // Complex animation with multiple properties
/// Keyframes("bounce")
///     .keyframe(.from, [
///         "transform": "translateY(0)",
///         "animation-timing-function": "ease-out"
///     ])
///     .keyframe(.percentage(40), [
///         "transform": "translateY(-30px)",
///         "animation-timing-function": "ease-in"
///     ])
///     .keyframe([.percentage(60), .percentage(80)], [
///         "transform": "translateY(0)",
///         "animation-timing-function": "ease-out"
///     ])
///     .keyframe(.percentage(100), [
///         "transform": "translateY(0)"
///     ])
/// ```
public struct Keyframes: AtRule {
    public static let identifier: String = "keyframes"
    
    public var rawValue: String
    private var name: String
    private var keyframes: [Keyframe] = []
    
    public init(rawValue: String) {
        self.rawValue = rawValue
        
        // Extract name from rawValue - simplified implementation
        if let nameRange = rawValue.range(of: "@keyframes\\s+([^\\s{]+)", options: .regularExpression),
           let matches = rawValue[nameRange].range(of: "\\s+([^\\s{]+)", options: .regularExpression) {
            self.name = String(rawValue[matches]).trimmingCharacters(in: .whitespacesAndNewlines)
        } else {
            self.name = ""
        }
    }
    
    /// Creates a keyframes rule with the specified name.
    ///
    /// - Parameter name: The name of the animation.
    public init(_ name: String) {
        self.name = name
        self.rawValue = "@keyframes \(name) {}"
    }
    
    /// Updates the raw value based on the current keyframes.
    private mutating func updateRawValue() {
        var sections: [String] = []
        
        for frame in keyframes {
            var styleLines: [String] = []
            
            for (property, value) in frame.styles {
                styleLines.append("    \(property): \(value);")
            }
            
            if !styleLines.isEmpty {
                let selectorString = frame.selectors.map { $0.rawValue }.joined(separator: ", ")
                let stylesString = styleLines.joined(separator: "\n")
                sections.append("  \(selectorString) {\n\(stylesString)\n  }")
            }
        }
        
        let keyframesString = sections.joined(separator: "\n\n")
        
        if keyframesString.isEmpty {
            rawValue = "@keyframes \(name) {}"
        } else {
            rawValue = "@keyframes \(name) {\n\(keyframesString)\n}"
        }
    }
    
    /// Adds a keyframe to the animation.
    ///
    /// - Parameters:
    ///   - selector: The keyframe selector.
    ///   - styles: The styles to apply at this keyframe.
    /// - Returns: An updated Keyframes instance.
    public func keyframe(_ selector: KeyframeSelector, _ styles: [String: String]) -> Keyframes {
        return keyframe([selector], styles)
    }
    
    /// Adds a keyframe with multiple selectors to the animation.
    ///
    /// - Parameters:
    ///   - selectors: The keyframe selectors.
    ///   - styles: The styles to apply at this keyframe.
    /// - Returns: An updated Keyframes instance.
    public func keyframe(_ selectors: [KeyframeSelector], _ styles: [String: String]) -> Keyframes {
        var keyframes = self
        let frame = Keyframe(selectors: selectors, styles: styles)
        
        // Check if we already have a keyframe with the same selectors
        if let index = keyframes.keyframes.firstIndex(where: { $0.selectors == frame.selectors }) {
            // Merge the styles
            var updatedFrame = keyframes.keyframes[index]
            for (key, value) in frame.styles {
                updatedFrame.styles[key] = value
            }
            keyframes.keyframes[index] = updatedFrame
        } else {
            // Add a new keyframe
            keyframes.keyframes.append(frame)
        }
        
        keyframes.updateRawValue()
        return keyframes
    }
}

// MARK: - Keyframe Types

extension Keyframes {
    /// Represents a single keyframe.
    fileprivate struct Keyframe: Sendable, Hashable {
        var selectors: [KeyframeSelector]
        var styles: [String: String]
    }
    
    /// Represents a keyframe selector.
    public enum KeyframeSelector: Sendable, Hashable {
        /// Starting keyframe (0%).
        case from
        
        /// Ending keyframe (100%).
        case to
        
        /// Percentage-based keyframe.
        case percentage(Int)
        
        /// Named timeline range keyframe.
        case timelineRange(String, Int)
        
        public var rawValue: String {
            switch self {
            case .from:
                return "from"
            case .to:
                return "to"
            case .percentage(let value):
                return "\(value)%"
            case .timelineRange(let name, let value):
                return "\(name) \(value)%"
            }
        }
    }
}
