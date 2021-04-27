class Person {
  String firstName;

  Person() {
    print('Person: non ');
  }

  Person.fromJson(Map data) {
    print('in Person');
  }

  static walk() {
    print("walk");
  }
}



class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }

  Employee() {
    print('Employee non');
  }
}

main() {
  var tem0 = new Employee();

  var emp = new Employee.fromJson({});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  emp.firstName = 'Bob';

  // （1）调用静态方法
  Person.walk();
}
