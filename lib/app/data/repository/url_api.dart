class ProdEnvironment {
  final baseUrl = "https://api.elise.bizfly.site";
  final baseApi = "/";
  final baseVersion = "v1";
  final receiveTimeout = 2 * 60 * 1000;
  final connectTimeout = 2 * 60 * 1000;

  String get apiUrl => "$baseUrl$baseApi$baseVersion";
}

final environment = ProdEnvironment();

//TODO: format url : url+ endpoint

const urlLogin = "/auth/social-login";
const urlLoginWithPhone = "/auth/login";
const urlRegister = '/auth/register';
const urlOTPRegister = '/auth/verify-otp';
const urlRefreshToken = "/auth/refresh-token";
const urlProductListing = "/app/products/loadall";
const urlProductDetail = "/app/products";
const urlProductDetailAuthenticated = "/app/products/auth";
const urlMemberAddress = "/customer/me";
const urlShippingAddresses = "/customer/address-book";
const urlProvinces = "/location/provinces";
const urlDistricts = "/location/districts";
const urlWards = "/location/wards";
