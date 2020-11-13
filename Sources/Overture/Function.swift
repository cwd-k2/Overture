// 力こそパワー
// というか引数の多い関数を作るほうがアホ

func curry<A, B>
(_ f: @escaping (A) -> B)
-> (A) -> B
{ { a in f(a) } }

func curry<A, B, C>
(_ f: @escaping (A, B) -> C)
-> (A) -> (B) -> C
{ { a in { b in f(a, b) } } }

func curry<A, B, C, D>
(_ f: @escaping (A, B, C) -> D)
-> (A) -> (B) -> (C) -> D
{ { a in { b in { c in f(a, b, c) } } } }

func curry<A, B, C, D, E>
(_ f: @escaping (A, B, C, D) -> E)
-> (A) -> (B) -> (C) -> (D) -> E
{ { a in { b in { c in { d in f(a, b, c, d) } } } } }

func curry<A, B, C, D, E, F>
(_ f: @escaping (A, B, C, D, E) -> F)
-> (A) -> (B) -> (C) -> (D) -> (E) -> F
{ { a in { b in { c in { d in { e in f(a, b, c, d, e) } } } } } }

prefix operator %

public prefix func % <A, B>
(f: @escaping (A) -> B)
-> (A) -> B
{ curry(f) }

public prefix func % <A, B, C>
(f: @escaping (A, B) -> C)
-> (A) -> (B) -> C
{ curry(f) }

public prefix func % <A, B, C, D>
(f: @escaping (A, B, C) -> D)
-> (A) -> (B) -> (C) -> D
{ curry(f) }

public prefix func % <A, B, C, D, E>
(f: @escaping (A, B, C, D) -> E)
-> (A) -> (B) -> (C) -> (D) -> E
{ curry(f) }

public prefix func % <A, B, C, D, E, F>
(_ f: @escaping (A, B, C, D, E) -> F)
-> (A) -> (B) -> (C) -> (D) -> (E) -> F
{ curry(f) }
