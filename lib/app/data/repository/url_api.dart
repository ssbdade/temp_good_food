class ProdEnvironment {
  // ip tại nhà
  // final baseUrl = "http://192.168.1.186:8080";
  // ip tại công ty
  final baseUrl = "http://192.168.22.97:8080";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;

  String get apiUrl => "$baseUrl";
}

final environment = ProdEnvironment();

//TODO: format url : url+ endpoint

// const urlLogin = "/auth/social-login";
// const urlLoginWithPhone = "/auth/login";
// const urlRegister = '/auth/register';
// const urlOTPRegister = '/auth/verify-otp';
// const urlRefreshToken = "/auth/refresh-token";
// const urlProductListing = "/app/products/loadall";
// const urlProductDetail = "/app/products";
// const urlProductDetailAuthenticated = "/app/products/auth";
// const urlMemberAddress = "/customer/me";
// const urlShippingAddresses = "/customer/address-book";
// const urlProvinces = "/location/provinces";
// const urlDistricts = "/location/districts";
// const urlWards = "/location/wards";
const urlLogin = "/auth";
const urlGetUser = '/v1/customers';
const urlAddCustomer = "/v1/customers";

const urlGetDatabase = '/v1/databases';
