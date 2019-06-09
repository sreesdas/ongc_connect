class Employees {
  List<Employee> employees;

  Employees({ this.employees });

  Employees.fromJson(List<dynamic> json) {
    if (json != null) {
      employees = new List<Employee>();
      json.forEach((v) {
        employees.add(new Employee.fromJson(v));
      });
    }
  }

  Employees.fromMap(List<Map<String, dynamic>> map) {
    if (Map() != null) {
      employees = new List<Employee>();
      map.forEach((v) {
        employees.add(new Employee.fromMap(v));
      });
    }
  }
}

class Employee {

  int id;
  String cpf;
  String name;
  String designation;

  Employee({
    this.id,
    this.cpf,
    this.name,
    this.designation
  });

  Employee.fromJson( dynamic json ) {
    id = json['id'];
    cpf = json['cpf'];
    name = json['name'];
    designation = json['designation'];
  }

  Employee.fromMap( Map<String, dynamic> map) {
    id = map['id'];
    cpf = map['cpf'];
    name = map['name'];
    designation = map['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cpf'] = this.cpf;
    data['name'] = this.name;
    data['designation'] = this.designation;
    return data;
  }

}