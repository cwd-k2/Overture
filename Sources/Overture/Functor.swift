// precedencegroup FunctorMapPrecedence {
//   associativity: left
//   higherThan: CastingPrecedence, DefaultPrecedence
// }

infix operator <%> //: FunctorMapPrecedence

public protocol Functor {
  associatedtype Morphism
  associatedtype F
  func fmap(_: (Morphism) -> Any) -> F
}

//

extension Array: Functor {
  public typealias Morphism = Element
  public typealias F = [Any]
  public func fmap<T>(_ f: (Element) -> T) -> [T] { map(f) }
}

extension Array {
  public static func <%> <T> (f: (Element) -> T, x: Self) -> [T] { x.fmap(f) }
}

