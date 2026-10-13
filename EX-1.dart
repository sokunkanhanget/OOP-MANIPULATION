enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearOfExperience;

  Employee(
    this._name,
    this._baseSalary, {
    List<Skill> skills = const [],
    Address? address,
    int yearOfExperience = 0,
  })  : _skills = List.unmodifiable(skills),
        _address = address ?? Address('Unknown', 'Unknown', '0000'),
        _yearOfExperience = yearOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;

  Employee.webDeveloper(
    String name, {
    Address? address,
    int yearsOfExperience = 0,
  }) : this(
          name,
          50000,
          skills: [Skill.FLUTTER, Skill.DART],
          address: address,
          yearOfExperience: yearsOfExperience,
        );

  double calculateTotalSalary() {
    double totalSalary = 0;
    int bonusSkills = 0;
    for ( final skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          bonusSkills += 5000;
          break;
        case Skill.DART:
          bonusSkills += 3000;
          break;
        case Skill.OTHER:
          bonusSkills += 1000;
          break;
      }
    }
    totalSalary += _baseSalary + (_yearOfExperience * 1000) + bonusSkills;
    return totalSalary;
  }

  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary},Total Salary: \$${calculateTotalSalary()}');
  }
}


void main() {
  var emp1 = Employee('Sokea', 40000);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000);
  emp2.printDetails();
}