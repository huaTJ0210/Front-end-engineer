import Foundation

/*
  【 命令模式 】
   1、尝试以对象来代表实际行动
   2、命令对象可以把行动（action）及其参数封装起来
   3、这些行动：可重复、取消、取消后再重做
 */

protocol DoorCommand {
    func excute() -> String
}

class OpenCommand: DoorCommand{
    let door: String
    
   required init(door: String) {
        self.door = door
    }
    func excute() -> String{
        return "\(door) is open"
    }
}

class CloseCommand: DoorCommand {
    let door: String
    
    required init(door: String) {
        self.door = door
    }
    
    func excute() -> String{
        return "\(door) is closed"
    }
}

final class HAL9000DoorsOperations{
    var closeCommand: CloseCommand
    var openCommand: OpenCommand
    
    init(door: String) {
        self.closeCommand = CloseCommand(door: door)
        self.openCommand = OpenCommand(door: door)
    }
    
    func open() -> String {
        openCommand.excute()
    }
    func close() -> String {
        closeCommand.excute()
    }
}

/*
 let podBayDoors = "Pod Bay Doors"
 let doorModule = HAL9000DoorsOperations(doors:podBayDoors)

 doorModule.open()
 doorModule.close()
 */
