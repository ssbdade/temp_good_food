class ResponseListDatabases {
  List<Content>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  ResponseListDatabases(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.size,
      this.number,
      this.sort,
      this.numberOfElements,
      this.first,
      this.empty});

  ResponseListDatabases.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    pageable = json['pageable'] != null ? new Pageable.fromJson(json['pageable']) : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['totalPages'] = this.totalPages;
    data['totalElements'] = this.totalElements;
    data['last'] = this.last;
    data['size'] = this.size;
    data['number'] = this.number;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['numberOfElements'] = this.numberOfElements;
    data['first'] = this.first;
    data['empty'] = this.empty;
    return data;
  }
}

class Content {
  int? databaseId;
  Customer? customer;
  int? dbId;
  String? dbType;
  String? dbName;
  String? dbVersion;
  String? dbRole;
  String? description;
  bool? isClustered;
  bool? hasStandby;
  bool? active;
  int? createdDate;
  double? thresholdFra;
  double? thresholdAsmDiskGroup;
  double? thresholdOSMountPoint;
  double? thresholdTablespace;

  Content(
      {this.databaseId,
      this.customer,
      this.dbId,
      this.dbType,
      this.dbName,
      this.dbVersion,
      this.dbRole,
      this.description,
      this.isClustered,
      this.hasStandby,
      this.active,
      this.createdDate,
      this.thresholdFra,
      this.thresholdAsmDiskGroup,
      this.thresholdOSMountPoint,
      this.thresholdTablespace});

  Content.fromJson(Map<String, dynamic> json) {
    databaseId = json['databaseId'];
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
    dbId = json['dbId'];
    dbType = json['dbType'];
    dbName = json['dbName'];
    dbVersion = json['dbVersion'];
    dbRole = json['dbRole'];
    description = json['description'];
    isClustered = json['isClustered'];
    hasStandby = json['hasStandby'];
    active = json['active'];
    createdDate = json['createdDate'];
    thresholdFra = json['thresholdFra'];
    thresholdAsmDiskGroup = json['thresholdAsmDiskGroup'];
    thresholdOSMountPoint = json['thresholdOSMountPoint'];
    thresholdTablespace = json['thresholdTablespace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['databaseId'] = this.databaseId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['dbId'] = this.dbId;
    data['dbType'] = this.dbType;
    data['dbName'] = this.dbName;
    data['dbVersion'] = this.dbVersion;
    data['dbRole'] = this.dbRole;
    data['description'] = this.description;
    data['isClustered'] = this.isClustered;
    data['hasStandby'] = this.hasStandby;
    data['active'] = this.active;
    data['createdDate'] = this.createdDate;
    data['thresholdFra'] = this.thresholdFra;
    data['thresholdAsmDiskGroup'] = this.thresholdAsmDiskGroup;
    data['thresholdOSMountPoint'] = this.thresholdOSMountPoint;
    data['thresholdTablespace'] = this.thresholdTablespace;
    return data;
  }
}

class Customer {
  int? customerId;
  String? customerName;
  String? address;
  String? telephone;
  String? email;
  String? representative;
  String? description;
  String? fullname;
  bool? active;

  Customer(
      {this.customerId,
      this.customerName,
      this.address,
      this.telephone,
      this.email,
      this.representative,
      this.description,
      this.fullname,
      this.active});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    address = json['address'];
    telephone = json['telephone'];
    email = json['email'];
    representative = json['representative'];
    description = json['description'];
    fullname = json['fullname'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['address'] = this.address;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['representative'] = this.representative;
    data['description'] = this.description;
    data['fullname'] = this.fullname;
    data['active'] = this.active;
    return data;
  }
}

class Pageable {
  Sort? sort;
  int? offset;
  int? pageSize;
  int? pageNumber;
  bool? unpaged;
  bool? paged;

  Pageable({this.sort, this.offset, this.pageSize, this.pageNumber, this.unpaged, this.paged});

  Pageable.fromJson(Map<String, dynamic> json) {
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['pageSize'] = this.pageSize;
    data['pageNumber'] = this.pageNumber;
    data['unpaged'] = this.unpaged;
    data['paged'] = this.paged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? unsorted;
  bool? sorted;

  Sort({this.empty, this.unsorted, this.sorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    unsorted = json['unsorted'];
    sorted = json['sorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['unsorted'] = this.unsorted;
    data['sorted'] = this.sorted;
    return data;
  }
}
