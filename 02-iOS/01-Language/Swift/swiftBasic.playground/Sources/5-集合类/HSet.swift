import Foundation

public class HZSet{
    public static func test(){
        /*
          (1) 如何创建Set
         */
        var letters = Set<Character>()
        letters.insert("c")
        print(letters)
        
        var course: Set<String> = ["Math","English","HIstory"]
        course.insert("History")
        print(course)
        
        for item in course {
            print(item) // 遍历Set：【Set的无序性，如果需要按照顺序输出则需要sorted进行排序】
        }
        
        /*
           （2）基本的数据类型(Int、Bool、String)是实现了hashable协议的可以直接使用Set进行存储
            自定义类型需要遵循hashable才能在Set中存储
         */
        var  persons: Set<Person> = [Person(name: "zhangsan", age: 20)]
        print(persons)
        
        /*
         (3) 添加元素
         */
        persons.update(with: Person(name: "li", age: 30)) // 如果相等替换为新元素，如果set中不存在则插入
        persons.update(with: Person(name: "zhangsan", age: 30))
        persons.insert(Person(name: "wang", age: 25))
        print(persons)
        print("\n")
        /*
         (4) 移除元素 [remove/removeAll/removeFirst]
         */
//        print(persons.filter({ (person) -> Bool in
//            person.age > 20
//        }))
        
        let a: Set<Character> = ["a","b","c"]
        let b: Set<Character> = ["b","d","e","f"]
        print(a.symmetricDifference(b)) // 对称差分： 将两个序列中共同拥有的元素排除后得到的集合
        print(a.subtracting(b)) // 将集合a中属于b集合b的元素去除
    }
}

struct Person {
    var name: String
    var age : Int
}

extension Person: Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
      //  hasher.combine(age)
    }
}

extension Person: Equatable{
    static func == (lhs: Person,rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
}


