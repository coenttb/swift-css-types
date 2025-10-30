import CSSTypeTypes
import Foundation

/// The `counter-increment` CSS property increases or decreases the value of CSS counters.
///
/// This property can be used to:
/// - Increase a counter (default behavior, adding 1)
/// - Increase a counter by a specific value
/// - Decrease a counter (by using negative values)
/// - Increment multiple counters in a single declaration
/// - Prevent counters from being changed
///
/// - Note: If a named counter doesn't exist, it will be created. The counter's value
///         can be reset with the `counter-reset` property.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/counter-increment)
public enum CounterIncrement: Property {
  public static let property: String = "counter-increment"
  /// An individual counter with an optional increment value
  public struct Counter: Sendable, Hashable {
    /// The name of the counter
    public let name: CustomIdent

    /// The value to add to the counter (negative values subtract)
    public let value: Int?

    /// Creates a counter with an optional increment value
    /// - Parameters:
    ///   - name: The name of the counter
    ///   - value: The value to add to the counter (defaults to 1 if nil)
    public init(name: CustomIdent, value: Int? = nil) {
      self.name = name
      self.value = value
    }
  }

  /// Do not increment any counters
  case none

  /// Increment a single counter by 1
  case counter(CustomIdent)

  /// Increment a single counter by the specified value
  case counterWithValue(CustomIdent, Int)

  /// Increment multiple counters with their respective values
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
    case .counters(let counters):
      return counters.map { counter in
        if let value = counter.value {
          return "\(counter.name) \(value)"
        } else {
          return counter.name.description
        }
      }.joined(separator: " ")
    case .global(let value):
      return value.description
    }
  }
}
