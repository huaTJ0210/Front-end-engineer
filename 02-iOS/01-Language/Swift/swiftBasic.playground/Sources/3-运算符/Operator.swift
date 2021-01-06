import Foundation

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

// 【二元运算符的重载】
extension Vector2D{
    // 对结构体的 "+" 运算符进行重载
    static func +(left:Vector2D,right:Vector2D)->Vector2D{
        return Vector2D(x:left.x+right.x,y:left.y+right.y)
    }
}
// 【一元运算符的重载】
extension Vector2D{
    // 一元运算符需要在func前面 加prefix关键字
    static prefix func -(vector:Vector2D)->Vector2D{
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}
// 【组合赋值运算符】
extension Vector2D{
    // 函数内部修改传递的变量：  inout
    static func +=(left: inout Vector2D,right:Vector2D){
         left = left + right
    }
}
//【==】运算符的重载
extension Vector2D:Equatable{
    static func ==(left:Vector2D,right:Vector2D)->Bool{
        return (left.x == right.x) && left.y == right.y
    }
}

// 【自定义运算符】
prefix operator +++

extension Vector2D{
    static prefix func +++(vector:inout Vector2D){
        vector += vector
    }
}

public class Operator{
   
    public static func test(){
        /*
          (1) 赋值和算数运算符
          =
           a!
          !a
         +、-、*、/、%
         a ？b : c
         */
        
        
        /*
          (2) 溢出运算符
         &+
         &-
         &*
         */
        let num1:UInt8 = 251
//        let  num2 = num1 + 20  加法导致值溢出
        let num2 = num1  &+ 20
        print(num2)
        
        /*
          (3) 合并空值运算符（为了optional）
         a ?? b  【三元运算作用到optional上】
         */
        let a: Int? = 10 // 可选值包裹的类型
        let b = 8
        print(a ?? b)
        
        /*
          (4) 区间运算符
         */
        // (1)闭区间
        for i in 1...5 {
            print(i)
        }
        //(2)半开半闭
        for i in 1..<5{
            print(i)
        }
        //(3)闭区间的单侧形式运算符
        let names = ["li","wang","zhang","liu"]
        for name in names[..<2]{
            print(name)
        }
        
        let range = ...5
        print(range.contains(7))
        
        var welcome = "hello,world"
        let range1 = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range1)
        print(welcome)
        
        let welcome1 = "hello,world"
        let range2 = "a"..."z"
        for char in welcome1{
            if !range2.contains(String(char)){
                print("\(char) is not lowercase" )
            }
        }
        
        /*
          (5) 位运算符
         ~  ： 取反运算符
         & ： 都是1才返回1
         | ： 任意为1，返回1
         异或 ^：异或也叫半加运算，其运算法则相当于不带进位的二进制加法
         [a⊕b = (¬a ∧ b) ∨ (a ∧¬b)如果a、b两个值不相同，则异或结果为1。如果a、b两个值相同，异或结果为0]
         左移： <<  乘以 2
         右移 ： >> 除以 2
         
        ***** 计算机中存储数值的方式 ****
         符号位 + 数值位
         正数：符号位为 0 数值位为对应的二进制
         负数：符号位为1，数值位采用补码的方式存储【例：求-5的补码。
         -5对应负数5（10000101）→所有位取反（11111010）→加00000001(11111011)
         所以-5的补码是11111011。】
         
         */
        // (1) 两个数字交换不借助中间变量
        var x = 10
        var y = 8
        x = x ^ y
        y = x ^ y
        x = x ^ y
        print(x)
        print(y)
        
        /*
         (6) 运算符的优先级
         
         */
        /*
         (7) 运算符的重载
         */
        
    }

}

/********************************* 位运算相关实例 ***************************************************/

/*
   (0) 交换两个数字不借助中间变量
 */


/*
 （1） 基本解法
 求无符号整数二进制中1的个数：
 一个8位整数 ： 10 100 001 先判断最后一位是否为1；采用"与操作"
 将此8位整数数字与 00000001进行"与"操作。如果结果为为1，则表示当前的8位整数最后一位为1，否则为0
 当判断第2位时，需要将该8位整数右移位，再延续之前的操作即可
 */
func countOfOnes(num:UInt) -> UInt {
    var count: UInt = 0
    var temp = num
    while temp != 0 {
        count += (temp & 1)
        temp = temp >> 1
    }
    return count
}

/*
 （2） 高效解法：
 求无符号整数二进制中1的个数：跳过0位的判断
  例如: 11 000 000 如何跳过低位的6个0；直接判断第7位的1？
 可以设计 11 000 000 和 10 111 111（11 000 000 - 1）做"与"操作；消除低位的1；
 判断当前数是否为0 不为0则计数+1；继续执行上述步骤
*/
func countOfOnes2(num:UInt) -> UInt {
    var count: UInt = 0
    var temp = num
    while temp != 0 {
        count += 1
        temp = temp & (temp - 1) // 从右向左依次将低位的1 变成 0
    }
    return count
}

/*
   (3) 如何判断一个整数为2的整数次幂
   给定一个无符号整型变量，判断是否为2的整数次幂
 */
func isPowerOfTwo(num:UInt) -> Bool {
    return (num & (num - 1))  == 0
}

/*
   (4) 缺失的数字
 很多成对出现的正整数保存在磁盘文件中，注意成对的数字不一定是相邻的，如2，3，4，3，4，2... 由于意外有一个数字消失了，如何尽快找到那个数字消失了？
 解题思路：
 （1）异或操作：如果两个相等的数进行异或操作，等到的结果是0；
   0与任何数字进行异或操作仍旧是数字本身；
   数组中所有的数字进行异或操作后，相同的数字异或后变为0；
   最终只剩下一个数字与0异或就是丢失的数字
 */
func findLostNum(nums:[UInt])->UInt{
    var lostNum:UInt = 0
    for num in nums {
        lostNum = lostNum ^ num
    }
    return lostNum
}

/*
   (5) 缺失的数字
 很多成对出现的正整数保存在磁盘文件中，注意成对的数字不一定是相邻的，如2，3，4，3，4，2... 由于意外有2个数字消失了（这两个数字不相等），如何尽快找到那个数字消失了？
 解题思路：
  根据（4）中的思路如果能将这两个丢失的数字分到2个组中；
 然后对两组数分别进行异或操作就可以得到丢失的数字
  那么该如何进行分组：
  
 */
func findLostNumber2(nums:[UInt]) -> (UInt,UInt) {
    var lostNum1: UInt = 0;
    var lostNum2:UInt = 0;
    var temp:UInt = 0;
    //计算单独出现的两个数的异或结果
    for num in nums {
        temp = temp ^ num
    }
    // 找出第一个为1的位【从右往做找到两个数第一个不同位】
    var flag:UInt = 1;
    while (flag & temp) == 0 {
        flag = flag << 1   // 1000
    }
    // 找两个丢失的数字
    for num in nums {
        // 设立flag的位上不为1
        if(num & flag) == 0{
            lostNum1 = lostNum1 ^ num // 例如该组第3位都是不为1的
        }else{
            lostNum2 = lostNum2 ^ num //该组第3位都是为1的
        }
    }
    return (lostNum1,lostNum2)
}
/*
  （6）缺失的数字
     数组中，只有一个数出现一次，剩下的都出现三次，找出出现一次的数字
 */
