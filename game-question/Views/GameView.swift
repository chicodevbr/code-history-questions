//
//  ContentView.swift
//  game-question
//
//  Created by fjunior on 06/10/22.
//

import SwiftUI

struct GameView: View {
    let question = Question(
        questionText: "What was the first computer bug?",
        possibleAnswers: ["Ant", "Beatle", "Moth", "fly"],
        correctAnswerIndex: 2)
    
    @State var mainColor = GameColor.main
   
    
    
    var body: some View {
        ZStack {
            mainColor.ignoresSafeArea()
            VStack {
                Text("1/10")
                    .font(.callout)
                    .multilineTextAlignment(.leading)
                    .padding()
                Text(question.questionText)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack {
                  ForEach(0..<question.possibleAnswers.count, id: \.self) {
                      answerIndex in
                    Button(action: {
                      print("Tapped on option with the text: \(question.possibleAnswers[answerIndex])")
                        mainColor = answerIndex == question.correctAnswerIndex ? .green : .red
                    }, label: {
                      ChoiceTextView(choiceText: question.possibleAnswers[answerIndex])
                    })
                  }
                }
                
            }
            
            
        }
        .foregroundColor(.white)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
