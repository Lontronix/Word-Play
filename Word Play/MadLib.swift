//
//  Word.swift
//  Word Play
//
//  Created by Lonnie Gerol on 11/26/18.
//  Copyright © 2018 Lontronix. All rights reserved.
//  Story 1: Move Quotes 1: http://www.madtakes.com/libs/093.html
//  Story 2: Abducted by aliens: http://www.madtakes.com/libs/106.html
//  story 3: Popular Video Game: http://www.madtakes.com/libs/021.html
//
import UIKit
enum WordType: String{
    case Noun
    case Verb
    case Adjective
}


import Foundation
class Word{
    var specificWordType: String?
    var userInput: String?
    
    init(specificWordType: String?) {
        self.specificWordType = specificWordType
    }
    
}

class MadLib{
    var nouns: [Word] = [Word]()
    var verbs: [Word] = [Word]()
    var adjectives = [Word]()
    var storyNumber = Int()
    
    init() {
        
    }
    
    func setStoryNumber(newStoryNumber: Int){
        verbs = [Word]()
        nouns = [Word]()
        adjectives = [Word]()
        storyNumber = newStoryNumber
        switch newStoryNumber {
        case 0:
            verbs.append(Word(specificWordType: nil))
            verbs.append(Word(specificWordType: "a verb ending in \"ing\""))
            nouns.append(Word(specificWordType: nil))
            adjectives.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: "An Occupation"))
            nouns.append(Word(specificWordType: "An Animal"))
            adjectives.append(Word(specificWordType: nil))
            verbs.append(Word(specificWordType: "Verb ending in \"ing\""))
            nouns.append(Word(specificWordType: nil))
            
        case 1:
           verbs.append(Word(specificWordType: "a verb ending in \"ing\""))
            verbs.append(Word(specificWordType: "a verb ending in \"ed\""))
             verbs.append(Word(specificWordType: "a verb ending in \"ed\""))
            nouns.append(Word(specificWordType: nil))
            verbs.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: "animal"))
            nouns.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: "place"))
            nouns.append(Word(specificWordType: "number"))




        default:
            adjectives.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: "Italian Name"))
            nouns.append(Word(specificWordType: "Occupation"))
            verbs.append(Word(specificWordType: "Verb ending in \"ing\""))
            nouns.append(Word(specificWordType: "Plant (Plural)"))
            adjectives.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: "Noun (Plural)"))
            nouns.append(Word(specificWordType: nil))
            nouns.append(Word(specificWordType: "name"))
        }
        
    }
    
    
    func generateStory() -> NSMutableAttributedString{
         let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .regular)]
        switch storyNumber{
        case 0:
            let attrStoryString: NSMutableAttributedString = NSMutableAttributedString(string: "\"My name is ", attributes: attributes)
                attrStoryString.append(verbs[0].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: "\"; learn it well, for it's the ", attributes: attributes))
                attrStoryString.append(verbs[1].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: " sound of your ", attributes: attributes))
                attrStoryString.append(nouns[0].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: ". I told Killian I'd be ", attributes: attributes))
                attrStoryString.append(adjectives[0].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: ". I wouldn't want to be a/an ", attributes: attributes))
                attrStoryString.append(nouns[1].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: ". I'm a cybernetic ", attributes: attributes))
                attrStoryString.append(nouns[2].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: ": living tissue over a/an ", attributes: attributes))
                attrStoryString.append(adjectives[0].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: " endoskeleton. If things have gone wrong, I'm ", attributes: attributes))
                attrStoryString.append(verbs[2].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: " myself, and you've got a wet ", attributes: attributes))
                attrStoryString.append(nouns[3].userInput!.formatAsUserInput())
            attrStoryString.append(NSMutableAttributedString(string: "wrapped around your head. - Arnold Schwarzenegger", attributes: attributes))
            return  attrStoryString
            
        case 1:
            let attrStoryString: NSMutableAttributedString = NSMutableAttributedString(string: "I was ", attributes: attributes)
            attrStoryString.append(verbs[0].userInput!.formatAsUserInput())
            
               attrStoryString.append(NSMutableAttributedString(string: " along the sidewalk when an alien ", attributes: attributes))
                attrStoryString.append(verbs[1].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " me. I was ", attributes: attributes))
                attrStoryString.append(verbs[2].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " into their ", attributes: attributes))
                attrStoryString.append(nouns[0].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " and it blasted off. Then the alien asked me to ", attributes: attributes))
                attrStoryString.append(verbs[3].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " on the TV. I was suprised they spoke english. The aliens had a pet ", attributes: attributes))
                attrStoryString.append(nouns[1].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: ". We ordered a ", attributes: attributes))
                attrStoryString.append(nouns[2].userInput!.formatAsUserInput())
                    attrStoryString.append(NSMutableAttributedString(string: " and it tasted good. As we came back into the galaxy, one alien asked me if I wanted a ", attributes: attributes))
                attrStoryString.append(nouns[3].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " I said no but I would like a ", attributes: attributes))
                attrStoryString.append(nouns[4].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: ". He got it for me and then dropped me off at my ", attributes: attributes))
                attrStoryString.append(nouns[5].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: ". then I realized I had been gone for ", attributes: attributes))
                attrStoryString.append(nouns[6].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " years!", attributes: attributes))
                return attrStoryString
        default:
            let attrStoryString: NSMutableAttributedString = adjectives[0].userInput!.formatAsUserInput()
                attrStoryString.append(NSMutableAttributedString(string: " ", attributes: attributes))
                attrStoryString.append(nouns[0].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " Brothers is a popular video game where you control a/an ", attributes: attributes))
                attrStoryString.append(nouns[1].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " as they run through levels ", attributes: attributes))
                attrStoryString.append(verbs[0].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " on enemies and eating ", attributes: attributes))
                attrStoryString.append(nouns[2].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: "to get ", attributes: attributes))
                attrStoryString.append(adjectives[0].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " and fireflowers so that he/she can throw ", attributes: attributes))
                attrStoryString.append(nouns[3].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " at enemies. He does all this to save the ", attributes: attributes))
                attrStoryString.append(nouns[4].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: " from the evil ", attributes: attributes))
                attrStoryString.append(nouns[5].userInput!.formatAsUserInput())
                attrStoryString.append(NSMutableAttributedString(string: ".", attributes: attributes))
            return attrStoryString
            
            
        }
        
    }
     
    
}

extension String{
    func formatAsUserInput() -> NSMutableAttributedString{
        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)]
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
}

extension NSMutableAttributedString{
    func formatStringForDisplay(){
        self.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 24, weight: .regular), range: NSRange(location: 0, length: self.length - 1))
    }
    
}
