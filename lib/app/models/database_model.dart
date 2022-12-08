class DataBase {
  String id;
  String dbName;
  String dbId;
  String dbRole;
  String dbVersion;
  String customer;
  int asmDisk;
  int fra;
  int mountPoint;
  int tableSpace;
  String ghiChu;
  bool isActive;

  DataBase(
  {required this.id,
      required this.dbName,
    required this.dbId,
      required this.dbRole,
    required this.dbVersion,
    required this.customer,
    required this.asmDisk,
    required this.fra,
    required this.mountPoint,
    required this.tableSpace,
    required this.ghiChu,
    required this.isActive}  );

  List<String> genList() {
    return [
      id,
      dbName,
      dbId,
      dbRole,
      dbVersion,
      customer,
      asmDisk.toString(),
      fra.toString(),
      mountPoint.toString(),
      tableSpace.toString(),
      ghiChu,
    ];
  }

}