import Foundation

/*
   【迭代器模式】：
     迭代器模式可以让用户通过特定的接口寻访容器中的每一个元素而不需要了解底层实现
 */

// 中篇小说
struct Novella {
    let name: String
}

struct Novellas {
    let novellas: [Novella]
}


struct NovellasIterator: IteratorProtocol {

    private var current = 0
    private let novellas: [Novella]

    init(novellas: [Novella]) {
        self.novellas = novellas
    }

    mutating func next() -> Novella? {
        defer { current += 1 }
        return novellas.count > current ? novellas[current] : nil
    }
}

extension Novellas: Sequence {
    func makeIterator() -> NovellasIterator {
        return NovellasIterator(novellas: novellas)
    }
}

/*
 let greatNovellas = Novellas(novellas: [Novella(name: "The Mist")] )

 for novella in greatNovellas {
     print("I've read: \(novella)")
 }
 */
