abstract class BaseConfig {
  String get apiHost;
  String get relayUrl;
  String get imgBaseUrl;
  // Application Name
  String get productListing;
  String get validate;
  String get mpin;
  String get productDetails;
  String get fetchMasterData;
  String get inventoryUpload;
  String get masterUpload;
  String get fetchImage;
  String get updateInventory;
  String get pendingInventory;
  String get topSearch;
  String get getAllData;
  String get orderHistory;
  String get dealerWiseOrder;
}

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "https://devtest.samil.in/";

  @override
  String get relayUrl => "https://relay.novactech.net/";

  @override
  String get imgBaseUrl =>
      'https://devtest.samil.in/uatq2sadmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "sellerproducts";

  @override
  String get validate => "sellerlogin";

  @override
  String get mpin => "sellerlogin";

  @override
  String get productDetails => "sellerproducts";

  @override
  String get fetchMasterData => "sellermaster";

  @override
  String get inventoryUpload => "sellerinventory";

  @override
  String get masterUpload => "sellermaster";

  @override
  String get fetchImage => "sellermaster";

  @override
  String get updateInventory => "Filter";

  @override
  String get pendingInventory => "Publishinv";

  @override
  String get topSearch => "sellersearch";

  @override
  String get getAllData => "sellerleftfilter";

  @override
  String get orderHistory => "sellerorder";

  @override
  String get dealerWiseOrder => "sellerorder";
}

class StagingConfig implements BaseConfig {
  @override
  String get apiHost => "https://devtest.samil.in/";

  @override
  String get relayUrl => "https://relay.novactech.net/";

  @override
  String get imgBaseUrl =>
      'https://devtest.samil.in/uatq2sadmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "sellerproductsSIT";

  @override
  String get validate => "sellerloginSIT";

  @override
  String get mpin => "sellerloginSIT";

  @override
  String get productDetails => "sellerproductsSIT";

  @override
  String get fetchMasterData => "sellermasterSIT";

  @override
  String get inventoryUpload => "sellerinventorySIT";

  @override
  String get masterUpload => "sellermasterSIT";

  @override
  String get fetchImage => "sellermasterSIT";

  @override
  String get updateInventory => "FilterSIT";

  @override
  String get pendingInventory => "PublishinvSIT";

  @override
  String get topSearch => "sellersearchSIT";

  @override
  String get getAllData => "sellerleftfilterSIT";

  @override
  String get orderHistory => "sellerorderSIT";

  @override
  String get dealerWiseOrder => "sellerorderSIT";
}

class UatConfig implements BaseConfig {
  @override
  String get apiHost => "https://uatecomapi.novactech.net/";

  @override
  String get relayUrl => "https://uatrelay.samil.in/";

  @override
  String get imgBaseUrl =>
      'https://uatq2s.shriramvalue.me/UATQ2SAdmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "ecomproducts";

  @override
  String get validate => "ecomlogin";

  @override
  String get mpin => "ecomlogin";

  @override
  String get productDetails => "ecomproducts";

  @override
  String get fetchMasterData => "ecommaster";

  @override
  String get inventoryUpload => "ecominventory";

  @override
  String get masterUpload => "ecommaster";

  @override
  String get fetchImage => "ecommaster";

  @override
  String get updateInventory => "ecomfilter";

  @override
  String get pendingInventory => "ecompublish";

  @override
  String get topSearch => "ecomtopsearch";

  @override
  String get getAllData => "ecomleftfilter";

  @override
  String get orderHistory => "ecomorder";

  @override
  String get dealerWiseOrder => "ecomorder";
}

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "https://ecomapi.q2s.in/";

  @override
  String get relayUrl => "https://relay.samil.in/";

  @override
  String get imgBaseUrl =>
      'https://beta.q2s.in/q2sAdmin/CommonFunctions/OAS_ImageDisplay.ashx?Path=';

  @override
  String get productListing => "ecomproducts";

  @override
  String get validate => "ecomlogin";

  @override
  String get mpin => "ecomlogin";

  @override
  String get productDetails => "ecomproducts";

  @override
  String get fetchMasterData => "ecommaster";

  @override
  String get inventoryUpload => "ecominventory";

  @override
  String get masterUpload => "ecommaster";

  @override
  String get fetchImage => "ecommaster";

  @override
  String get updateInventory => "ecomfilter";

  @override
  String get pendingInventory => "ecompublish";

  @override
  String get topSearch => "ecomtopsearch";

  @override
  String get getAllData => "ecomleftfilter";

  @override
  String get orderHistory => "ecomorder";

  @override
  String get dealerWiseOrder => "ecomorder";
}

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();
  static const String dev = 'DEV';
  static const String staging = 'STAGING';
  static const String uat = 'UAT';
  static const String prod = 'PROD';

  BaseConfig? config;
  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.staging:
        return StagingConfig();
      case Environment.uat:
        return UatConfig();
      default:
        return DevConfig();
    }
  }
}
