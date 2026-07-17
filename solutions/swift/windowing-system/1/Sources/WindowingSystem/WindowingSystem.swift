// TODO: Define the Size struct
struct Size {
    var width: Int = 80
    var height: Int = 60

    mutating func resize(newWidth: Int, newHeight: Int) {
        self.width = newWidth
        self.height = newHeight
    }
}

// TODO: Define the Position struct
struct Position {
    var x: Int = 0
    var y: Int = 0
    mutating func moveTo(newX: Int, newY: Int) {
        self.x = newX
        self.y = newY
    }
}

// TODO: Define the Window class
class Window {
    var title: String = "New Window"
    let screenSize: Size = Size(width: 800, height: 600)
    var size: Size = Size()
    var position: Position = Position()
    var contents: String? = nil

    init(title: String = "New Window", contents: String? = nil, size: Size = Size(), position: Position = Position()) {
        self.title = title
        self.contents = contents
        self.size = size
        self.position = position
    }

    func resize(to: Size) {
        
            self.size.height = max(1, min(self.screenSize.height - position.y, to.height))
            self.size.width = max(1, min(self.screenSize.width - position.x, to.width))
        
    }
    func move(to: Position) {
        if (to.x >= 0 && to.y >= 0) {
            self.position.x = min(self.screenSize.width - self.size.width, to.x)
            self.position.y = min(self.screenSize.height - size.height, to.y)
        }
    }
    func update(title: String) {
        self.title = title
    }
    func update(text: String?) {
        self.contents = text
    }
    func display() -> String {
        let content = contents != nil ? contents! : "[This window intentionally left blank]"
        return "\(title)\nPosition: (\(position.x), \(position.y)), Size: (\(size.width) x \(size.height))\n\(content)\n"
    }
}
