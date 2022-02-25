import UIKit

class Tutorial{
    var title:String
    unowned var author:Author
    weak var editor:Editor?
    lazy var description: () -> String = {
     "\(self.title) by \(self.author.name)"
   }
    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }
    deinit {
        print("Goodbye tutorial \(title)!")
    }
}
class Author {
    let name: String
    var tutorials: [Tutorial] = []
    init(name: String) {
        self.name = name
    }
    deinit {
        print("Goodbye author \(name)!")
    }
}
class Editor {
  let name: String
  var tutorials: [Tutorial] = []
  init(name: String) {
    self.name = name
  }
deinit {
    print("Goodbye editor \(name)!")
  }
}
do {
  let author = Author(name: "Cosmin")
  let tutorial = Tutorial(title: "Memory management",
                          author: author)
  let editor = Editor(name: "Ray")
  author.tutorials.append(tutorial)
  tutorial.editor = editor
  editor.tutorials.append(tutorial)
}

var counter = 0
var foo = {[counter] print(counter)}
counter = 1
foo()
