class Student {
  String name;
  int age;
  String major;
  List<String> courses;

  Student(this.name, this.age, this.major, this.courses);

  void displayInfo() {
    print('Name: $name');
    print('Age: $age');
    print('Major: $major');
    print('Courses: ${courses.join(', ')}');
  }
}
