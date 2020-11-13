precedencegroup FunctionApplyFromRightPrecedence {
  associativity: right
  lowerThan: AdditionPrecedence, DefaultPrecedence
}

precedencegroup FunctionApplyFromLeftPrecedence {
  associativity: left
  lowerThan: AdditionPrecedence, DefaultPrecedence
}

infix operator <|: FunctionApplyFromRightPrecedence
@discardableResult
public func <| <T, S>(f: @escaping (T) -> S, x: T) -> S { f(x) }

infix operator |>: FunctionApplyFromLeftPrecedence
@discardableResult
public func |> <T, S>(x: T, f: @escaping (T) -> S) -> S { f(x) }
