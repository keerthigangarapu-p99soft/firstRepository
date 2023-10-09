import { LightningElement } from 'lwc';

export default class QuizApp extends LightningElement {
    quizquestion=[{
        questionid:1,
        question:"question",
        options:{
            option1:"anw22",
            option1:"anw3",
        },
        correctoption:"ans1"
    },
    {
    questionid:2,
        question:"question2",
        options:{
            option1:"anw1",
            option1:"anw22",
            option1:"anw32",
        },
        correctoption:"ans12"
    },
    {
    questionid:3,
        question:"question3",
        options:{
            option1:"anw2",
            option1:"anw22",
            option1:"anw3",
        },
        correctoption:"ans133"
    }
]

}