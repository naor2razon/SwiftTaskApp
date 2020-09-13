

import Foundation

enum TaskType{
    case daily,weekly,monthly
}

struct Task {
    var name : String
    var type : TaskType
    var completd : Bool
    var lastCompleted : NSDate?
}

