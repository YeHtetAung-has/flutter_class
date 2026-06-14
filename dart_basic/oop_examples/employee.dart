class employee {
  String? name;
  String? position;
  double? salary;

  String get employeeName => name ?? '';
  String get employeePosition => position ?? '';
  double get employeeSalary => salary ?? 0.0;
}
