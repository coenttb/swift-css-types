import Foundation
import CSSTypeTypes

/// Represents a CSS @container at-rule.
///
/// The @container CSS at-rule is a conditional group rule that applies styles to a
/// containment context. Style declarations are filtered by a condition and applied to
/// the container if the condition is true.
///
/// Examples:
/// ```swift
/// // Simple width query
/// Container.width(.greaterThan(.px(400)))
///
/// // Query with a container name
/// Container("sidebar", .maxWidth(.px(300)))
///
/// // Combining conditions with 'and'
/// Container.width(.greaterThan(.px(400)))
///     .and(.height(.greaterThan(.px(300))))
///
/// // Combining conditions with 'or'
/// Container.width(.greaterThan(.px(400)))
///     .or(.height(.greaterThan(.px(300))))
///
/// // Using the 'not' operator
/// Container.not(.width(.lessThan(.px(400))))
///
/// // Using scroll state
/// Container.scrollState(.scrollable(.top))
/// ```
public struct Container: AtRule {
    public static let identifier: String = "container"
    
    public var rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    /// Creates a container query with a name and condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - condition: The condition to apply.
    public init(_ name: String? = nil, _ condition: Condition) {
        if let name = name {
            self.rawValue = "@container \(name) \(condition.rawValue)"
        } else {
            self.rawValue = "@container \(condition.rawValue)"
        }
    }
    
    /// Creates a container query with a width condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The width comparison.
    /// - Returns: A new Container instance.
    public static func width(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .width(comparison))
    }
    
    /// Creates a container query with a height condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The height comparison.
    /// - Returns: A new Container instance.
    public static func height(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .height(comparison))
    }
    
    /// Creates a container query with an inline-size condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The inline-size comparison.
    /// - Returns: A new Container instance.
    public static func inlineSize(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .inlineSize(comparison))
    }
    
    /// Creates a container query with a block-size condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The block-size comparison.
    /// - Returns: A new Container instance.
    public static func blockSize(name: String? = nil, _ comparison: SizeComparison) -> Container {
        Container(name, .blockSize(comparison))
    }
    
    /// Creates a container query with an aspect-ratio condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - comparison: The aspect-ratio comparison.
    /// - Returns: A new Container instance.
    public static func aspectRatio(name: String? = nil, _ comparison: RatioComparison) -> Container {
        Container(name, .aspectRatio(comparison))
    }
    
    /// Creates a container query with an orientation condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - orientation: The orientation.
    /// - Returns: A new Container instance.
    public static func orientation(name: String? = nil, _ orientation: Orientation) -> Container {
        Container(name, .orientation(orientation))
    }
    
    /// Creates a container query with a scroll-state condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - state: The scroll state to query.
    /// - Returns: A new Container instance.
    public static func scrollState(name: String? = nil, _ state: ScrollState) -> Container {
        Container(name, .scrollState(state))
    }
    
    /// Creates a container query with a style condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - feature: The style feature to query.
    /// - Returns: A new Container instance.
    public static func style(name: String? = nil, _ feature: String) -> Container {
        Container(name, .style(feature))
    }
    
    /// Creates a container query with a negated condition.
    ///
    /// - Parameters:
    ///   - name: Optional container name.
    ///   - condition: The condition to negate.
    /// - Returns: A new Container instance.
    public static func not(name: String? = nil, _ condition: Condition) -> Container {
        Container(name, .not(condition))
    }
    
    /// Combines this container query with another using the 'and' operator.
    ///
    /// - Parameter condition: The condition to add.
    /// - Returns: A new Container instance.
    public func and(_ condition: Condition) -> Container {
        // Extract existing condition string by removing "@container " prefix
        let existingCondition = String(rawValue.dropFirst(11))
        return Container(rawValue: "@container \(existingCondition) and \(condition.rawValue)")
    }
    
    /// Combines this container query with another using the 'or' operator.
    ///
    /// - Parameter condition: The condition to add.
    /// - Returns: A new Container instance.
    public func or(_ condition: Condition) -> Container {
        // Extract existing condition string by removing "@container " prefix
        let existingCondition = String(rawValue.dropFirst(11))
        return Container(rawValue: "@container \(existingCondition) or \(condition.rawValue)")
    }
}

// MARK: - Container Conditions

extension Container {
    /// Represents a condition in a container query.
    public struct Condition: RawRepresentable, Hashable, Sendable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// Creates a width condition.
        public static func width(_ comparison: SizeComparison) -> Condition {
            Condition(rawValue: "(width \(comparison.rawValue))")
        }
        
        /// Creates a height condition.
        public static func height(_ comparison: SizeComparison) -> Condition {
            Condition(rawValue: "(height \(comparison.rawValue))")
        }
        
        /// Creates an inline-size condition.
        public static func inlineSize(_ comparison: SizeComparison) -> Condition {
            Condition(rawValue: "(inline-size \(comparison.rawValue))")
        }
        
        /// Creates a block-size condition.
        public static func blockSize(_ comparison: SizeComparison) -> Condition {
            Condition(rawValue: "(block-size \(comparison.rawValue))")
        }
        
        /// Creates an aspect-ratio condition.
        public static func aspectRatio(_ comparison: RatioComparison) -> Condition {
            Condition(rawValue: "(aspect-ratio \(comparison.rawValue))")
        }
        
        /// Creates an orientation condition.
        public static func orientation(_ orientation: Orientation) -> Condition {
            Condition(rawValue: "(orientation: \(orientation.rawValue))")
        }
        
        /// Creates a scroll-state condition.
        public static func scrollState(_ state: ScrollState) -> Condition {
            Condition(rawValue: "scroll-state(\(state.rawValue))")
        }
        
        /// Creates a style condition.
        public static func style(_ feature: String) -> Condition {
            Condition(rawValue: "style(\(feature))")
        }
        
        /// Creates a negated condition.
        public static func not(_ condition: Condition) -> Condition {
            Condition(rawValue: "not \(condition.rawValue)")
        }
    }
    
    /// Represents a size comparison in a container query.
    public struct SizeComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// Creates an equals comparison.
        public static func equalTo(_ value: LengthPercentage) -> SizeComparison {
            SizeComparison(rawValue: "= \(value)")
        }
        
        /// Creates a greater than comparison.
        public static func greaterThan(_ value: LengthPercentage) -> SizeComparison {
            SizeComparison(rawValue: "> \(value)")
        }
        
        /// Creates a less than comparison.
        public static func lessThan(_ value: LengthPercentage) -> SizeComparison {
            SizeComparison(rawValue: "< \(value)")
        }
        
        /// Creates a greater than or equal to comparison.
        public static func greaterThanOrEqual(_ value: LengthPercentage) -> SizeComparison {
            SizeComparison(rawValue: ">= \(value)")
        }
        
        /// Creates a less than or equal to comparison.
        public static func lessThanOrEqual(_ value: LengthPercentage) -> SizeComparison {
            SizeComparison(rawValue: "<= \(value)")
        }
        
        /// Creates a range comparison.
        public static func range(min: LengthPercentage, max: LengthPercentage) -> SizeComparison {
            SizeComparison(rawValue: "\(min) <= && <= \(max)")
        }
    }
    
    /// Represents a ratio comparison in a container query.
    public struct RatioComparison: RawRepresentable, Hashable, Sendable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// Creates an equals comparison.
        public static func equalTo(_ width: Int, _ height: Int) -> RatioComparison {
            RatioComparison(rawValue: "= \(width)/\(height)")
        }
        
        /// Creates a greater than comparison.
        public static func greaterThan(_ width: Int, _ height: Int) -> RatioComparison {
            RatioComparison(rawValue: "> \(width)/\(height)")
        }
        
        /// Creates a less than comparison.
        public static func lessThan(_ width: Int, _ height: Int) -> RatioComparison {
            RatioComparison(rawValue: "< \(width)/\(height)")
        }
        
        /// Creates a greater than or equal to comparison.
        public static func greaterThanOrEqual(_ width: Int, _ height: Int) -> RatioComparison {
            RatioComparison(rawValue: ">= \(width)/\(height)")
        }
        
        /// Creates a less than or equal to comparison.
        public static func lessThanOrEqual(_ width: Int, _ height: Int) -> RatioComparison {
            RatioComparison(rawValue: "<= \(width)/\(height)")
        }
    }
    
    /// Represents orientation values for container queries.
    public enum Orientation: String, Hashable, Sendable {
        case portrait
        case landscape
    }
    
    /// Represents a scroll state query in a container query.
    public struct ScrollState: RawRepresentable, Hashable, Sendable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// Creates a scrollable scroll state query.
        public static func scrollable(_ direction: ScrollDirection) -> ScrollState {
            ScrollState(rawValue: "scrollable: \(direction.rawValue)")
        }
        
        /// Creates a stuck scroll state query.
        public static func stuck(_ direction: ScrollDirection) -> ScrollState {
            ScrollState(rawValue: "stuck: \(direction.rawValue)")
        }
        
        /// Creates a snapped scroll state query.
        public static func snapped(_ direction: ScrollDirection) -> ScrollState {
            ScrollState(rawValue: "snapped: \(direction.rawValue)")
        }
    }
    
    /// Represents scroll directions for scroll state queries.
    public enum ScrollDirection: String, Hashable, Sendable {
        case none
        case top
        case right
        case bottom
        case left
        case x
        case y
        case blockStart = "block-start"
        case blockEnd = "block-end"
        case inlineStart = "inline-start"
        case inlineEnd = "inline-end"
        case block
        case inline
        case both
    }
}

// MARK: - Operator Overloads

extension Container {
    /// Operator for combining conditions with the 'and' operator.
    ///
    /// Example:
    /// ```swift
    /// let query = Container.width(.greaterThan(.px(400))) && Container.height(.greaterThan(.px(300)))
    /// ```
    public static func && (lhs: Container, rhs: Container) -> Container {
        // Extract condition from right-hand side by removing "@container " prefix
        let rhsCondition = String(rhs.rawValue.dropFirst(11))
        return lhs.and(Condition(rawValue: rhsCondition))
    }
    
    /// Operator for combining conditions with the 'or' operator.
    ///
    /// Example:
    /// ```swift
    /// let query = Container.width(.greaterThan(.px(400))) || Container.height(.greaterThan(.px(300)))
    /// ```
    public static func || (lhs: Container, rhs: Container) -> Container {
        // Extract condition from right-hand side by removing "@container " prefix
        let rhsCondition = String(rhs.rawValue.dropFirst(11))
        return lhs.or(Condition(rawValue: rhsCondition))
    }
}
