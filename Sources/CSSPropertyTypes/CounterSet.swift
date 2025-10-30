import CSSTypeTypes
import Foundation

/// The `counter-set` CSS property sets CSS counters to given values.
///
/// Unlike `counter-reset` which is meant to create and initialize counters,
/// `counter-set` is intended to be used for adjusting the value of existing counters.
///
/// - Note: If a counter doesn't exist, `counter-set` will create it, but this is not the recommended
///         usage. It's better to use `counter-reset` to create new counters.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/counter-set)
public enum CounterSet: Property {
  public static let property: String = "counter-set"

  /// An individual counter with an optional value
  public struct Counter: Sendable, Hashable {
    /// The name of the counter
    public let name: CustomIdent

    /// The value to set the counter to (defaults to 0 if nil)
    public let value: Int?

    /// Creates a counter with an optional value
    /// - Parameters:
    ///   - name: The name of the counter
    ///   - value: The value to set the counter to (defaults to 0 if nil)
    public init(name: CustomIdent, value: Int? = nil) {
      self.name = name
      self.value = value
    }
  }

  /// Do not set any counters
  case none

  /// Set a single counter to 0
  case counter(CustomIdent)

  /// Set a single counter to the specified value
  case counterWithValue(CustomIdent, Int)

  /// Set multiple counters with their respective values
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
