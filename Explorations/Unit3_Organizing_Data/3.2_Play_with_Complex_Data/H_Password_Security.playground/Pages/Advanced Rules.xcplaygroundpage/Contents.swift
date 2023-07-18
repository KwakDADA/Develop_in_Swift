/*:
## Advanced Rules
 You could also verify that a password contains at least one uppercase letter and one lowercase letter. That way an attacker can't limit their algorithm to lowercase letters, hoping a user was too lazy to use the shift key when typing their password.
 
 Another useful check is making sure that the password doesn't contain the username, so that the user can't choose "user01" and "user01password!".
 */
import Foundation
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
/*:
### Implement your algorithm below with the additional new rules:

- Contains at least one uppercase letter and one lowercase letter
- Doesn't contain the username
 
 - Note: To detect whether a character is uppercase, use the `isUppercase` property.
 */
func properPassword(username: String, password: String) {
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
[Previous](@previous)  |  page 3 of 5  |  [Next: Custom Algorithm](@next)
 */
