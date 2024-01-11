import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

//// Create an instance of Note that can be encoded
//let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp: Date())
//
////// Use an Encoder object to encode a value to a plist
////let propertyListEncoder = PropertyListEncoder()
////if let encodedNote = try? propertyListEncoder.encode(newNote) {
////    print(encodedNote)
////    
////    // decoding data
////    let propertyListDecoder = PropertyListDecoder()
////    if let decodedNote = try? propertyListDecoder.decode(Note.self, from: encodedNote) {
////        print(decodedNote)
////    }
////}
//
//// Interacting with the files on disk
//let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//// Pull path that provides a filename and extensions
//let archiveURL = documentsDirectory.appending(path: "notes_test").appending(path: "plist")
//
//// Encode
//let propertyListEncoder = PropertyListEncoder()
//let encodedNote = try? propertyListEncoder.encode(newNote)
//
//try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
//
//// Decode
//let propertyListDecoder = PropertyListDecoder()
//if let retrievedNoteData = try? Data(contentsOf: archiveURL),
//   let decodedNote = try? propertyListDecoder.decode(Note.self, from: retrievedNoteData) {
//    print(decodedNote)
//}

let note1 = Note(title: "Note One", text: "This is a sample note.", timestamp: Date())
let note2 = Note(title: "Note Two", text: "This is another sample note.", timestamp: Date())
let note3 = Note(title: "Note Three", text: "This is yet another sample note.", timestamp: Date())
let notes = [note1, note2, note3]

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appending(path: "notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(notes)
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL),
   let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotesData) {
    print(decodedNotes)
}
