
import 'package:temp_good_food/app/models/customer.dart';

import '../models/services.dart';

class CustomersData {
  static List<Customer> customers = [
    Customer(
        id: '1',
      name: 'Công ty cổ phần chứng khoán KB Việt Nam',
      sortName: 'KSBV',
      email: 'cuongpv@kbsec.com.vn',
      phone: '0987654321',
      note: '',
      isActive: true,
      services:
        [
          Service(
              name: 'Health Check',
            description: '',
            id: '1',
            status: 'Hoạt động',
              ),
          Service(
            name: 'Daily Check',
            description: '',
            id: '3',
            status: 'Hoạt động',
          ),
        ],
    ),
    Customer(
      id: '2',
      name: 'Ngân hàng chính sách xã hội',
      sortName: 'VBSP',
      email: '',
      phone: '',
      note: '',
      isActive: true,
      services: [
        Service(
          name: 'Health Check',
          description: '',
          id: '1',
          status: 'Hoạt động',
        ),
        Service(
          name: 'Daily Check',
          description: '',
          id: '3',
          status: 'Hoạt động',
        ),
      ],
    ),
    Customer(
      id: '3',
      name: 'Tổng công ty truyền hình cáp Việt Nam',
      sortName: 'VTV',
      email: 'daitri@vtvcab.vn',
      phone: '0974169894',
      note: 'Hệ thống quan trọng nhất của khách hàng là hệ thống CRM, bao gồm 3 node, tải nhình chung khá ổn định',
      isActive: true,
      services: [],
    ),
    Customer(
      id: '4',
      name: 'Bệnh viện Bạch Mai',
      sortName: '',
      email: 'mr.duydx@outlook.com',
      phone: '0974169894',
      note: '',
      isActive: true,
      services: [],
    ),
    Customer(
      id: '5',
      name: 'Viettel Peru - Bitel',
      sortName: 'KSBV',
      email: 'mr.duydx@outlook.com',
      phone: '0974169894',
      note: '',
      isActive: true,
      services: [],
    ),
    Customer(
      id: '6',
      name: 'Ngân hàng liên doanh Lào Việt - Laovietbank',
      sortName: '',
      email: 'mr.duydx@outlook.com',
      phone: '0974169894',
      note: '',
      isActive: true,
      services: [],
    ),
    Customer(
      id: '7',
      name: 'Bệnh viện Thống Nhất',
      sortName: '',
      email: 'mr.duydx@outlook.com',
      phone: '0974169894',
      note: '',
      isActive: true,
      services: [],
    )
  ];

}