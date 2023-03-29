import 'dart:io';

void main(List<String> args) {
  //Input output
  stdout.writeln("What is your name? ");
  String name = stdin.readLineSync()!;
  stdout.writeln("Welcome $name to your first dart program.");
  print('$name is that correct');
  //Type converstion
  stdout.writeln("$name, What is your age?");
  String sage = stdin.readLineSync()!;
  int age = int.parse(sage);
  stdout.writeln("Age num or not: $age");
  //int or other to string
  String s1 = 1.toString();
  //Null aware operator:
  // (?.), (??), (??=)
  //for handling null values associted with objects

  //Ternory operator
  //Condition ? value1 : value 2;

  /*There are five types of loops in dart language:
  1) Standard for loop:
  for(var i=1; i<10; i++){
    loop-body
    or print(num[i])
  }

  2) For-in loop:
  var num = [1,2,3];
  for(var n in num){
    print(n)
  }

  3) forEach loop:
  forEach is a higher order function which takes another function as 
  a parameter
  num.forEach( (n) => print(n));

  4) While loop:
  while(Condition){
    loop-body
  }

  5) do while loop:
  do{

  } while(condition)
  */

  //There are 3 built in colletion type in dart:
  //list set map

  /*List:
  List num = [1,2,3];
  or var num = [1,2,3];
  List name = ['Arif', 'Mohsin', 'Zohaib'];
  List name = ['Arif', 'Mohsin', 1, 10.56];
  print(name[0]);
  print(num.length);
  or for(var n in names)
  {

  }

  to copy all the element of the list in to another list:
  var name2 = [...name];
  */

  /*Set: is an collection of unordered data, data repetation is useless
     var cgroup = {'carbon', 'sulper', 'carbon'};

     for( var x in cgroup){
      print(x); it will only print carbon and sulpher
     }

     or Set <String> cgroup = {};
   */

  /* Map is a collection of key value pair of items (in python called dictinories):
  var items = {'Name': 'Arif', 'Class': 'BCS-5B'};
    print(items[class]);
    for empty map:
    var items = Map();
   */

  //Functions; and arrow function =>
  /*
  Functions:
  dynamic square (var num){
    return num*num;
  }

  arrow funtion:
  dynamic square(var num) => num*num;

  nameless functions or anonymus functions(in python lamda functions):
  forEach( (num){num * num;});

  parameters:
  1) named parameter 2) positioned parameter
  when parameters are named parameters then they become optional
  dynamic square({var num1, var num2})

  to make any position parameter optional just add parameter in []
  dynamic square( var num1, [var num2]) 

  remember: null over operators if incase of optional parameters and you are not
  passing in the values
   s*/

  /*OOP
  class objects constructor( default constructor and named constructor) 
  inheritance
  --outside the clss the final and const both works the same but with respect 
  to class if you ginal can be access by constructor but const cannot.

  default constructor:
   class Part {
    var name;
    var age;
    Part(var name, var age){
      this.name = name;
      this.age = age;
    }
    or
    Part(this.name, this.age);
    -- named condtructor:
    namedPart(var name, var age){
      this.name = Arif;
      this.age = 23;
    }
   }

   */
}
