import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';

class EDummyData {
  /// --- BANNERS
  // static final List<BannerModel> banners = [
  //   BannerModel(imageUrl: EImages.promoBanner1, targetScreen: ERoutes.order, active; false),
  //   BannerModel(imageUrl: EImages.promoBanner2, targetScreen: ERoutes.cart, active; true),
  //   BannerModel(imageUrl: EImages.promoBanner3, targetScreen: ERoutes.favourites, active; true),
  //   BannerModel(imageUrl: EImages.promoBanner4, targetScreen: ERoutes.search, active; true),
  //   BannerModel(imageUrl: EImages.promoBanner5, targetScreen: ERoutes.settings, active; true),
  //   BannerModel(imageUrl: EImages.promoBanner5, targetScreen: ERoutes.userAddress, active; true),
  //   BannerModel(imageUrl: EImages.promoBanner5, targetScreen: ERoutes.checkout, active; false),
  // ];

  /// --- USERS
  // static final UserModel user = UserModel(
  //   // id: id,
  //   // userName: userName,
  //   email: 'hdh.trung96@gmail.com',
  //   firstName: 'Trung',
  //   lastName: 'Hoang',
  //   phoneNumber: '09876543210',
  //   profilePicture: EImages.user,
  //   addresses: [
  //     AddressModel(
  //       id: '1',
  //       name: 'Coding with T',
  //       phoneNumber: '+923178059528',
  //       street: '82356 Timmy Coves',
  //       city: 'South Liana',
  //       state: 'Maine',
  //       postalCode: '87665',
  //       country: 'USA',
  //     ),
  //   ],
  // );

  /// --- CARTS
  // static final CartModel cart = CartModel(
  //   cartId: '001',
  //   items: [
  //     CartItemModel(
  //       productId: '001',
  //       variationId: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //   ],
  // );

  /// --- ORDERS
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'CWT0012',
  //     status: OrderStatus.processing,
  //     items: cart.items,
  //     totalAmount: 265,
  //     orderDate: DateTime(2023, 09, 1),
  //     deliveryDate: DateTime(2023, 09,9),
  //   ),
  // ];

  /* ----------------------------------------------------------------------- */
  /*                          List of all Categories                         */
  /* ----------------------------------------------------------------------- */

  static final List<CategoryModel> categories = [
    CategoryModel(id: 'root-sports', image: EImages.sportsIcon, name: ETexts.sports, isFeatured: true),
    CategoryModel(id: 'root-furniture', image: EImages.furnitureIcon, name: ETexts.furniture, isFeatured: true),
    CategoryModel(id: 'root-electronics', image: EImages.electronicsIcon, name: ETexts.electronics, isFeatured: true),
    CategoryModel(id: 'root-clothes', image: EImages.clothesIcon, name: ETexts.clothes, isFeatured: true),
    CategoryModel(id: 'root-animals', image: EImages.animalsIcon, name: ETexts.animals, isFeatured: true),
    CategoryModel(id: 'root-shoes', image: EImages.shoesIcon, name: ETexts.shoes, isFeatured: true),
    CategoryModel(id: 'root-cosmetics', image: EImages.cosmeticsIcon, name: ETexts.cosmetics, isFeatured: true),
    CategoryModel(id: 'root-jewellery', image: EImages.jewelleryIcon, name: ETexts.jewellery, isFeatured: true),
    CategoryModel(id: 'root-toys', image: EImages.toysIcon, name: ETexts.toys, isFeatured: true),

    /* --------------------------- Sub-Categories -------------------------- */

    CategoryModel(
      id: 'sub-sports-adidas',
      image: EImages.productShoesAdidas,
      name: 'Adidas',
      parentId: 'root-sports',
      isFeatured: false,
    ),
    CategoryModel(
      id: 'sub-sports-nike',
      image: EImages.productShoesNike,
      name: 'Nike',
      parentId: 'root-sports',
      isFeatured: false,
    ),
    CategoryModel(
      id: 'sub-sports-puma',
      image: EImages.productShoesPuma,
      name: 'Puma',
      parentId: 'root-sports',
      isFeatured: false,
    ),
    CategoryModel(
      id: 'sub-sports-skechers',
      image: EImages.productShoesSkechers,
      name: 'Skechers',
      parentId: 'root-sports',
      isFeatured: false,
    ),

    /* --------------------------- Sub-Categories -------------------------- */

    CategoryModel(
      id: 'sub-toys-bandai',
      image: EImages.productToysBandai,
      name: 'Bandai',
      parentId: 'root-toys',
      isFeatured: false,
    ),
    CategoryModel(
      id: 'sub-toys-kotobukiya',
      image: EImages.productToysKotobukiya,
      name: 'Kotobukiya',
      parentId: 'root-toys',
      isFeatured: false,
    ),
    CategoryModel(
      id: 'sub-toys-lego',
      image: EImages.productToysLego,
      name: 'Lego',
      parentId: 'root-toys',
      isFeatured: false,
    ),
    CategoryModel(
      id: 'sub-toys-schleich',
      image: EImages.productToysSchleich,
      name: 'Schleich',
      parentId: 'root-toys',
      isFeatured: false,
    ),

    /* --------------------------------------------------------------------- */
  ];
}
