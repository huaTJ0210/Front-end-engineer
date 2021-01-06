import Foundation

public class HZDictionary{
    public static func test(){
        var dic = ["zhang":20,"li":25]
        dic["zhang"] = 30
        dic.updateValue(40, forKey: "li")
        dic.updateValue(50, forKey: "liu")
        print(dic)
        
        var numDic = ["a":1,"b":2]
        numDic.merge(["a":2,"c":5]) { (current, _) -> Int in
            current
        }
        print(numDic)
        // KeyValuePairs : 保持定义的字典有序
        let kvs: KeyValuePairs = ["a":1,"b":2,"c":1]
        print(kvs)
    }
}
