/*:
## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() {
        print("\(title) is written by \(author), contains \(pages)pages and the price of this book is \(price).")
    }
}

let favBook = Book(title: "The Beatles Anthology", author: "The Beatles", pages: 364, price: 98000)
favBook.description()
//:  A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int

    mutating func like() {
        likes += 1
    }
}

var myPost = Post(message: "Hello, World!", likes: 2, numberOfComments: 5)
print(myPost.likes)
myPost.like()
print(myPost.likes)
/*:
[Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
 */
