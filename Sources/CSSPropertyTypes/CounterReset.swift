import Foundation
import CSSTypeTypes

/// The `counter-reset` CSS property creates named CSS counters and initializes them to specific values.
///
/// This property can be used to:
/// - Create counters with an initial value (defaults to 0)
/// - Create multiple counters in a single declaration
/// - Create reversed counters (for counting down instead of up)
///
/// - Note: Despite its name, `counter-reset` is used for creating and initializing counters.
///         Use `counter-set` to reset the value of an existing counter.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/counter-reset)
public enum CounterReset: Property {
    public static let property: String = "counter-reset"
    
    /// An individual counter with an optional initial value
    public struct Counter: Sendable, Hashable {
        /// The name of the counter
        public let name: CustomIdent
        
        /// Whether this is a reversed counter (counts down)
        public let reversed: Bool
        
        /// The initial value of the counter (defaults to 0 for regular counters if nil)
        public let value: Int?
        
        /// Creates a counter with an optional initial value
        /// - Parameters:
        ///   - name: The name of the counter
        ///   - reversed: Whether this is a reversed counter
        ///   - value: The initial value (defaults to 0 for regular counters if nil)
        public init(name: CustomIdent, reversed: Bool = false, value: Int? = nil) {
            self.name = name
            self.reversed = reversed
            self.value = value
        }
    }
    
    /// Do not create or reset any counters
    case none
    
    /// Create a single counter with default initial value (0)
    case counter(CustomIdent)
    
    /// Create a single counter with the specified initial value
    case counterWithValue(CustomIdent, Int)
    
    /// Create a reversed counter with default initial value
    case reversedCounter(CustomIdent)
    
    /// Create a reversed counter with the specified initial value
    case reversedCounterWithValue(CustomIdent, Int)
    
    /// Create multiple counters with their respective values
    case counters([Counter])
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .counter(let name):
            return name.description
        case .counterWithValue(let name, let value):
            return "\(name) \(value)"
        case .reversedCounter(let name):
            return "reversed(\(name))"
        case .reversedCounterWithValue(let name, let value):
            return "reversed(\(name)) \(value)"
        case .counters(let counters):
            return counters.map { counter in
                let nameStr = counter.reversed ? "reversed(\(counter.name))" : counter.name.description
                if let value = counter.value {
                    return "\(nameStr) \(value)"
                } else {
                    return nameStr
                }
            }.joined(separator: " ")
        case .global(let value):
            return value.description
        }
    }
}
