class Question {
  static List <Question>  getQuestions()=>[
    Question.name("1. Who invented C++?"," a) Dennis Ritchie ","b) Ken Thompson ","c) Brian Kernighan ","d) Bjarne Stroustrup", "d"),
    Question.name("2. What is C++? ","a) C++ is an object oriented programming language ","b) C++ is a procedural programming language ","c) C++ supports both procedural and object oriented programming language ","d) C++ is a functional programming language","c"),
    Question.name("3. Which of the following is the correct syntax of including a user defined header files in C++? ","a) #include [userdefined] ","b) #include “userdefined” ","c) #include <userdefined.h> ","d) #include <userdefined>","b"),
    Question.name("4. Which of the following is used for comments in C++?","a) /* comment */ ","b) // comment */ ","c) // comment","d) both // comment or /* comment */","d"),
    Question.name("5. Which of the following user-defined header file extension used in c++? ","a) hg ","b) cpp ","c) h ","d) hf","c"),
    Question.name("6. Which of the following is a correct identifier in C++? ","a) VAR_1234 ","b) \$var_name ","c) 7VARNAME"," d) 7var_name","a"),
    Question.name("7. Which of the following is not a type of Constructor in C++? ","a) Default constructor ","b) Parameterized constructor ","c) Copy constructor ","d) Friend constructor","d"),
    Question.name("8. Which of the following approach is used by C++?","a) Left-right ","b) Right-left ","c) Bottom-up ","d) Top-down","c"),
    Question.name("9. What is virtual inheritance in C++? ","a) C++ technique to enhance multiple inheritance ","b) C++ technique to ensure that a private member of the base class can be accessed somehow ","c) C++ technique to avoid multiple inheritances of classes"," d) C++ technique to avoid multiple copies of the base class into children/derived class","d"),
    Question.name("10. Which of the following type is provided by C++ but not C? ","a) double ","b) float ","c) int ","d) bool","d"),
    Question.name("11. By default, all the files in C++ are opened in _________ mode. ","a) Binary ","b) VTC ","c) Text ","d) ISCII","c"),
    Question.name("12. Which of the following correctly declares an array in C++? ","a) array{10}; ","b) array array[10]; ","c) int array; ","d) int array[10];","d"),
    Question.name("13. What is the size of wchar_t in C++? ","a) Based on the number of bits in the system ","b) 2 or 4 ","c) 4 ","d) 2","a"),
    Question.name("14. Which is more effective while calling the C++ functions? ","a) call by object ","b) call by pointer ","c) call by value ","d) call by reference","d"),
    Question.name("15. Which of the following is used to terminate the function declaration in C++? "," a) ; ","b) ] ","c) ) ","d) :","a"),
    Question.name("16. Which keyword is used to define the macros in c++?","a) #macro ","b) #define ","c) macro ","d) define","b"),
    Question.name("17. The C++ code which causes abnormal termination/behaviour of a program should be written under _________ block. ","a) catch ","b) throw ","c) try ","d) finally","c"),
    Question.name("18. What is Inheritance in C++? ","a) Deriving new classes from existing classes ","b) Overloading of classes ","c) Classes with same names ","d) Wrapping of data into a single class","a"),
    Question.name("19. Which of the following symbol is used to declare the preprocessor directives in C++? ","a) \$ ","b) ^ ","c) # ","d) *","c"),
    Question.name("20. What is meant by a polymorphism in C++? ","a) class having only single form ","b) class having four forms ","c) class having many forms","d) class having two forms","c"),
  ];
  Question.name(this.questionTest,this.a,this.b,this.c,this.d,this.answer);
  String questionTest;
  String a;
  String b;
  String c;
   String d;
  String answer;

}
