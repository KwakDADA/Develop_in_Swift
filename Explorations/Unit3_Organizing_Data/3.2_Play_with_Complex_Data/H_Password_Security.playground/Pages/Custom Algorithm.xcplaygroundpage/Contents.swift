/*:
## Custom Algorithm
 Think about more rules you could add to make your users' passwords even more secure. Implement your algorithm below.

 You can copy the code from the previous page as a starting point.
 */
import Foundation

func properPassword(username: String, password: String) {
    let tenCommonPasswords = [
        "123456",
        "123456789",
        "qwerty",
        "password",
        "12345678",
        "111111",
        "iloveyou",
        "1q2w3e",
        "123123",
        "password1"
    ]
    let digits = "0123456789"
    let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
    
    guard !tenCommonPasswords.contains(password) else {
        print("Please create a password that cannot be easily inferred.")
        return
    }
    
    guard password.count > 15 else {
        print("Password should be at least 16 characters.")
        return
    }
    
    guard !password.contains(username) else {
        print("Don't let the password include your name.")
        return
    }
    
    var digit = false
    var punc = false
    var upperCase = false
    var lowerCase = false
    
    for c in password {
        if c.isNumber {
            digit = true
        } else if punctuation.contains(c) {
            punc = true
        } else if c.isUppercase {
            upperCase = true
        } else if c.isLowercase {
            lowerCase = true
        }
    }
    
    if digit && punc && upperCase && lowerCase {
        print("It's a proper password.")
    } else {
        print("Please create an appropriate password that meets all the conditions.")
    }
}
/*:
[Previous](@previous)  |  page 4 of 5  |  [Next: Brute-Force Guessing](@next)
 */
