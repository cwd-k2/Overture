infix operator >>=

public protocol Monad {
  associatedtype Monoid
  associatedtype M
  func unit(_: Monoid) -> Self
  func bind(_: (Monoid) -> M) -> M
}

extension Array: Monad {
  public typealias Monoid = Element
  public typealias M = [Any]
  public func unit(_ x: Element) -> [Element] { [x] }
  public func bind<T>(_ f: (Element) -> [T]) -> [T] { map(f).flatMap{ $0 } }
}

extension Array {
  public static func >>= <T> (f: (Element) -> [T], x: Self) -> [T] { x.bind(f) }
}
