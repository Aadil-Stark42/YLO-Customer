class DashBoardDataModel {
  bool? status;
  String? message;
  HomePageData? homePageData;

  DashBoardDataModel({this.status, this.message, this.homePageData});

  DashBoardDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    homePageData = json['homePageData'] != null
        ? HomePageData.fromJson(json['homePageData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (homePageData != null) {
      data['homePageData'] = homePageData!.toJson();
    }
    return data;
  }
}

class HomePageData {
  List<Categories>? categories;
  List<Banners>? banners;
  List<PremiumOffers>? premiumOffers;
  List<LocalOffers>? localOffers;
  List<BrandProducts>? brandProducts;
  List<Shops>? shops;
  List<AvailableLocations>? availableLocations;
  int? notificationCount;
  String? countryImage;
  String? currencyCode;
  String? currencySign;
  String? countryMobileCode;
  String? razerpayKey;
  String? walletCoins;
  String? userImage;
  String? userName;
  String? referralCode;
  int? cartCount;
  int? accountId;
  String? paymentCustomerId;
  String? termsLink;
  String? privacyLink;

  HomePageData(
      {this.categories,
      this.banners,
      this.premiumOffers,
      this.localOffers,
      this.brandProducts,
      this.shops,
      this.availableLocations,
      this.notificationCount,
      this.countryImage,
      this.currencyCode,
      this.currencySign,
      this.countryMobileCode,
      this.razerpayKey,
      this.walletCoins,
      this.userImage,
      this.userName,
      this.referralCode,
      this.cartCount,
      this.accountId,
      this.paymentCustomerId,
      this.termsLink,
      this.privacyLink});

  HomePageData.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['premium_offers'] != null) {
      premiumOffers = <PremiumOffers>[];
      json['premium_offers'].forEach((v) {
        premiumOffers!.add(PremiumOffers.fromJson(v));
      });
    }
    if (json['local_offers'] != null) {
      localOffers = <LocalOffers>[];
      json['local_offers'].forEach((v) {
        localOffers!.add(LocalOffers.fromJson(v));
      });
    }
    if (json['brand_products'] != null) {
      brandProducts = <BrandProducts>[];
      json['brand_products'].forEach((v) {
        brandProducts!.add(BrandProducts.fromJson(v));
      });
    }
    if (json['shops'] != null) {
      shops = <Shops>[];
      json['shops'].forEach((v) {
        shops!.add(Shops.fromJson(v));
      });
    }
    if (json['available_locations'] != null) {
      availableLocations = <AvailableLocations>[];
      json['available_locations'].forEach((v) {
        availableLocations!.add(AvailableLocations.fromJson(v));
      });
    }
    notificationCount = json['notification_count'];
    countryImage = json['country_image'];
    currencyCode = json['currency_code'];
    currencySign = json['currency_sign'];
    countryMobileCode = json['country_mobile_code'];
    razerpayKey = json['razerpay_key'];
    walletCoins = json['wallet_coins'];
    userImage = json['user_image'];
    userName = json['user_name'];
    referralCode = json['referral_code'];
    cartCount = json['cart_count'];
    accountId = json['account_id'];
    paymentCustomerId = json['payment_customer_id'];
    termsLink = json['terms_link'];
    privacyLink = json['privacy_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (premiumOffers != null) {
      data['premium_offers'] = premiumOffers!.map((v) => v.toJson()).toList();
    }
    if (localOffers != null) {
      data['local_offers'] = localOffers!.map((v) => v.toJson()).toList();
    }
    if (brandProducts != null) {
      data['brand_products'] = brandProducts!.map((v) => v.toJson()).toList();
    }
    if (shops != null) {
      data['shops'] = shops!.map((v) => v.toJson()).toList();
    }
    if (availableLocations != null) {
      data['available_locations'] =
          availableLocations!.map((v) => v.toJson()).toList();
    }
    data['notification_count'] = notificationCount;
    data['country_image'] = countryImage;
    data['currency_code'] = currencyCode;
    data['currency_sign'] = currencySign;
    data['country_mobile_code'] = countryMobileCode;
    data['razerpay_key'] = razerpayKey;
    data['wallet_coins'] = walletCoins;
    data['user_image'] = userImage;
    data['user_name'] = userName;
    data['referral_code'] = referralCode;
    data['cart_count'] = cartCount;
    data['account_id'] = accountId;
    data['payment_customer_id'] = paymentCustomerId;
    data['terms_link'] = termsLink;
    data['privacy_link'] = privacyLink;
    return data;
  }
}

class Categories {
  String? categoriesTitle;
  bool? categoriesViewAll;
  List<CategoriesData>? categoriesData;

  Categories(
      {this.categoriesTitle, this.categoriesViewAll, this.categoriesData});

  Categories.fromJson(Map<String, dynamic> json) {
    categoriesTitle = json['categories_title'];
    categoriesViewAll = json['categories_view_all'];
    if (json['categories_data'] != null) {
      categoriesData = <CategoriesData>[];
      json['categories_data'].forEach((v) {
        categoriesData!.add(CategoriesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_title'] = categoriesTitle;
    data['categories_view_all'] = categoriesViewAll;
    if (categoriesData != null) {
      data['categories_data'] = categoriesData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesData {
  int? scId;
  String? scName;
  String? scImage;
  int? scCountry;

  CategoriesData({this.scId, this.scName, this.scImage, this.scCountry});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    scId = json['sc_id'];
    scName = json['sc_name'];
    scImage = json['sc_image'];
    scCountry = json['sc_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sc_id'] = scId;
    data['sc_name'] = scName;
    data['sc_image'] = scImage;
    data['sc_country'] = scCountry;
    return data;
  }
}

class Banners {
  String? bannersTitle;
  bool? bannersViewAll;
  List<BannersData>? bannersData;

  Banners({this.bannersTitle, this.bannersViewAll, this.bannersData});

  Banners.fromJson(Map<String, dynamic> json) {
    bannersTitle = json['banners_title'];
    bannersViewAll = json['banners_view_all'];
    if (json['banners_data'] != null) {
      bannersData = <BannersData>[];
      json['banners_data'].forEach((v) {
        bannersData!.add(BannersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banners_title'] = bannersTitle;
    data['banners_view_all'] = bannersViewAll;
    if (bannersData != null) {
      data['banners_data'] = bannersData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannersData {
  int? bannerId;
  int? shopId;
  String? bannerName;
  String? bannerImage;
  String? shopName;
  String? address;
  String? shortAddress;
  String? distance;

  BannersData(
      {this.bannerId,
      this.shopId,
      this.bannerName,
      this.bannerImage,
      this.shopName,
      this.address,
      this.shortAddress,
      this.distance});

  BannersData.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    shopId = json['shop_id'];
    bannerName = json['banner_name'];
    bannerImage = json['banner_image'];
    shopName = json['shop_name'];
    address = json['address'];
    shortAddress = json['short_address'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['shop_id'] = shopId;
    data['banner_name'] = bannerName;
    data['banner_image'] = bannerImage;
    data['shop_name'] = shopName;
    data['address'] = address;
    data['short_address'] = shortAddress;
    data['distance'] = distance;
    return data;
  }
}

class PremiumOffers {
  String? premiumOffersTitle;
  bool? premiumOffersViewAll;
  List<PremiumOffersData>? premiumOffersData;

  PremiumOffers(
      {this.premiumOffersTitle,
      this.premiumOffersViewAll,
      this.premiumOffersData});

  PremiumOffers.fromJson(Map<String, dynamic> json) {
    premiumOffersTitle = json['premium_offers_title'];
    premiumOffersViewAll = json['premium_offers_view_all'];
    if (json['premium_offers_data'] != null) {
      premiumOffersData = <PremiumOffersData>[];
      json['premium_offers_data'].forEach((v) {
        premiumOffersData!.add(PremiumOffersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['premium_offers_title'] = premiumOffersTitle;
    data['premium_offers_view_all'] = premiumOffersViewAll;
    if (premiumOffersData != null) {
      data['premium_offers_data'] =
          premiumOffersData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PremiumOffersData {
  int? offerId;
  String? offerTitle;
  String? offerName;
  int? offerValue;
  int? offerActualValue;
  int? offerQty;
  String? offerImage;
  int? shopId;
  String? shopName;
  String? shopAddress;
  String? shortAddress;
  String? distance;
  String? discountPercentage;
  String? coins;
  bool? isPremium;
  bool? isRecommended;
  int? recommendedCount;
  int buyqty = 1;

  PremiumOffersData({
    this.offerId,
    this.offerTitle,
    this.offerName,
    this.offerValue,
    this.offerActualValue,
    this.offerQty,
    this.offerImage,
    this.shopId,
    this.shopName,
    this.shopAddress,
    this.shortAddress,
    this.distance,
    this.discountPercentage,
    this.coins,
    this.isPremium,
    this.isRecommended,
    this.recommendedCount,
  });

  PremiumOffersData.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerTitle = json['offer_title'];
    offerName = json['offer_name'];
    offerValue = json['offer_value'];
    offerActualValue = json['offer_actual_value'];
    offerQty = json['offer_qty'];
    offerImage = json['offer_image'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    shortAddress = json['short_address'];
    distance = json['distance'];
    discountPercentage = json['discount_percentage'];
    coins = json['coins'];
    isPremium = json['is_premium'];
    isRecommended = json['is_recommended'];
    recommendedCount = json['recommended_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer_id'] = offerId;
    data['offer_title'] = offerTitle;
    data['offer_name'] = offerName;
    data['offer_value'] = offerValue;
    data['offer_actual_value'] = offerActualValue;
    data['offer_qty'] = offerQty;
    data['offer_image'] = offerImage;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['shop_address'] = shopAddress;
    data['short_address'] = shortAddress;
    data['distance'] = distance;
    data['discount_percentage'] = discountPercentage;
    data['coins'] = coins;
    data['is_premium'] = isPremium;
    data['is_recommended'] = isRecommended;
    data['recommended_count'] = recommendedCount;
    return data;
  }
}

class LocalOffers {
  String? localOffersTitle;
  bool? localOffersViewAll;
  List<LocalOffersData>? localOffersData;

  LocalOffers(
      {this.localOffersTitle, this.localOffersViewAll, this.localOffersData});

  LocalOffers.fromJson(Map<String, dynamic> json) {
    localOffersTitle = json['local_offers_title'];
    localOffersViewAll = json['local_offers_view_all'];
    if (json['local_offers_data'] != null) {
      localOffersData = <LocalOffersData>[];
      json['local_offers_data'].forEach((v) {
        localOffersData!.add(LocalOffersData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['local_offers_title'] = localOffersTitle;
    data['local_offers_view_all'] = localOffersViewAll;
    if (localOffersData != null) {
      data['local_offers_data'] =
          localOffersData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocalOffersData {
  int? offerId;
  String? offerTitle;
  String? offerName;
  int? offerValue;
  int? offerActualValue;
  int? offerQty;
  String? offerImage;
  int? shopId;
  String? shopName;
  String? shopAddress;
  String? shortAddress;
  String? distance;
  String? discountPercentage;
  String? coins;
  bool? isPremium;
  bool? isRecommended;
  int? recommendedCount;

  LocalOffersData(
      {this.offerId,
      this.offerTitle,
      this.offerName,
      this.offerValue,
      this.offerActualValue,
      this.offerQty,
      this.offerImage,
      this.shopId,
      this.shopName,
      this.shopAddress,
      this.shortAddress,
      this.distance,
      this.discountPercentage,
      this.coins,
      this.isPremium,
      this.isRecommended,
      this.recommendedCount});

  LocalOffersData.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerTitle = json['offer_title'];
    offerName = json['offer_name'];
    offerValue = json['offer_value'];
    offerActualValue = json['offer_actual_value'];
    offerQty = json['offer_qty'];
    offerImage = json['offer_image'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    shortAddress = json['short_address'];
    distance = json['distance'];
    discountPercentage = json['discount_percentage'];
    coins = json['coins'];
    isPremium = json['is_premium'];
    isRecommended = json['is_recommended'];
    recommendedCount = json['recommended_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer_id'] = offerId;
    data['offer_title'] = offerTitle;
    data['offer_name'] = offerName;
    data['offer_value'] = offerValue;
    data['offer_actual_value'] = offerActualValue;
    data['offer_qty'] = offerQty;
    data['offer_image'] = offerImage;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['shop_address'] = shopAddress;
    data['short_address'] = shortAddress;
    data['distance'] = distance;
    data['discount_percentage'] = discountPercentage;
    data['coins'] = coins;
    data['is_premium'] = isPremium;
    data['is_recommended'] = isRecommended;
    data['recommended_count'] = recommendedCount;
    return data;
  }
}

class BrandProducts {
  String? brandsTitle;
  bool? brandsViewAll;
  List<BrandsData>? brandsData;

  BrandProducts({this.brandsTitle, this.brandsViewAll, this.brandsData});

  BrandProducts.fromJson(Map<String, dynamic> json) {
    brandsTitle = json['brands_title'];
    brandsViewAll = json['brands_view_all'];
    if (json['brands_data'] != null) {
      brandsData = <BrandsData>[];
      json['brands_data'].forEach((v) {
        brandsData!.add(BrandsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brands_title'] = brandsTitle;
    data['brands_view_all'] = brandsViewAll;
    if (brandsData != null) {
      data['brands_data'] = brandsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BrandsData {
  int? offerId;
  String? offerTitle;
  String? offerName;
  int? categoryId;
  int? subCatId;
  int? offerValue;
  int? offerActualValue;
  int? offerQty;
  String? offerImage;
  int? shopId;
  String? shopName;
  String? shopAddress;
  String? shortAddress;
  String? distance;
  String? discountPercentage;
  String? coins;
  bool? isPremium;
  bool? isRecommended;
  int? recommendedCount;

  BrandsData(
      {this.offerId,
      this.offerTitle,
      this.offerName,
      this.categoryId,
      this.subCatId,
      this.offerValue,
      this.offerActualValue,
      this.offerQty,
      this.offerImage,
      this.shopId,
      this.shopName,
      this.shopAddress,
      this.shortAddress,
      this.distance,
      this.discountPercentage,
      this.coins,
      this.isPremium,
      this.isRecommended,
      this.recommendedCount});

  BrandsData.fromJson(Map<String, dynamic> json) {
    offerId = json['offer_id'];
    offerTitle = json['offer_title'];
    offerName = json['offer_name'];
    categoryId = json['category_id'];
    subCatId = json['sub_cat_id'];
    offerValue = json['offer_value'];
    offerActualValue = json['offer_actual_value'];
    offerQty = json['offer_qty'];
    offerImage = json['offer_image'];
    shopId = json['shop_id'];
    shopName = json['shop_name'];
    shopAddress = json['shop_address'];
    shortAddress = json['short_address'];
    distance = json['distance'];
    discountPercentage = json['discount_percentage'];
    coins = json['coins'];
    isPremium = json['is_premium'];
    isRecommended = json['is_recommended'];
    recommendedCount = json['recommended_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offer_id'] = offerId;
    data['offer_title'] = offerTitle;
    data['offer_name'] = offerName;
    data['category_id'] = categoryId;
    data['sub_cat_id'] = subCatId;
    data['offer_value'] = offerValue;
    data['offer_actual_value'] = offerActualValue;
    data['offer_qty'] = offerQty;
    data['offer_image'] = offerImage;
    data['shop_id'] = shopId;
    data['shop_name'] = shopName;
    data['shop_address'] = shopAddress;
    data['short_address'] = shortAddress;
    data['distance'] = distance;
    data['discount_percentage'] = discountPercentage;
    data['coins'] = coins;
    data['is_premium'] = isPremium;
    data['is_recommended'] = isRecommended;
    data['recommended_count'] = recommendedCount;
    return data;
  }
}

class Shops {
  String? shopsTitle;
  bool? shopsViewAll;
  List<ShopsData>? shopsData;

  Shops({this.shopsTitle, this.shopsViewAll, this.shopsData});

  Shops.fromJson(Map<String, dynamic> json) {
    shopsTitle = json['shops_title'];
    shopsViewAll = json['shops_view_all'];
    if (json['shops_data'] != null) {
      shopsData = <ShopsData>[];
      json['shops_data'].forEach((v) {
        shopsData!.add(ShopsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shops_title'] = shopsTitle;
    data['shops_view_all'] = shopsViewAll;
    if (shopsData != null) {
      data['shops_data'] = shopsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopsData {
  int? shopId;
  String? shopImage;
  String? shopName;
  String? address;
  String? shortAddress;
  String? distance;
  int? offerCount;
  bool? isRecommended;
  int? recommendedCount;
  bool? isOpened;
  bool? isFavourite;
  Object? minCoin;
  Object? maxCoin;

  ShopsData(
      {this.shopId,
      this.shopImage,
      this.shopName,
      this.address,
      this.shortAddress,
      this.distance,
      this.offerCount,
      this.isRecommended,
      this.recommendedCount,
      this.isOpened,
      this.isFavourite,
      this.minCoin,
      this.maxCoin});

  ShopsData.fromJson(Map<String, dynamic> json) {
    shopId = json['shop_id'];
    shopImage = json['shop_image'];
    shopName = json['shop_name'];
    address = json['address'];
    shortAddress = json['short_address'];
    distance = json['distance'];
    offerCount = json['offer_count'];
    isRecommended = json['is_recommended'];
    recommendedCount = json['recommended_count'];
    isOpened = json['is_opened'];
    isFavourite = json['is_favourite'];
    minCoin = json['min_coin'];
    maxCoin = json['max_coin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shop_id'] = shopId;
    data['shop_image'] = shopImage;
    data['shop_name'] = shopName;
    data['address'] = address;
    data['short_address'] = shortAddress;
    data['distance'] = distance;
    data['offer_count'] = offerCount;
    data['is_recommended'] = isRecommended;
    data['recommended_count'] = recommendedCount;
    data['is_opened'] = isOpened;
    data['is_favourite'] = isFavourite;
    data['min_coin'] = minCoin;
    data['max_coin'] = maxCoin;
    return data;
  }
}

class AvailableLocations {
  String? country;
  List<States>? states;

  AvailableLocations({this.country, this.states});

  AvailableLocations.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    if (states != null) {
      data['states'] = states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  String? state;
  List<Cites>? cites;

  States({this.state, this.cites});

  States.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['cites'] != null) {
      cites = <Cites>[];
      json['cites'].forEach((v) {
        cites!.add(Cites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    if (cites != null) {
      data['cites'] = cites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cites {
  String? city;
  String? address;

  Cites({this.city, this.address});

  Cites.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['address'] = address;
    return data;
  }
}
