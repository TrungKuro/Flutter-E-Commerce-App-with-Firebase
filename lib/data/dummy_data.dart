// import 'package:e_commerce_app/features/shop/models/banner_model.dart';
// import 'package:e_commerce_app/features/shop/models/category_model.dart';
// import 'package:e_commerce_app/utils/constants/image_strings.dart';
// import 'package:e_commerce_app/utils/constants/text_strings.dart';

// class EDummyData {
//   /// --- BANNERS
//   static final List<BannerModel> banners = [
//     BannerModel(imageUrl: EImages.promoBanner1, targetScreen: ERoutes.order, active; false),
//     BannerModel(imageUrl: EImages.promoBanner2, targetScreen: ERoutes.cart, active; true),
//     BannerModel(imageUrl: EImages.promoBanner3, targetScreen: ERoutes.favourites, active; true),
//     BannerModel(imageUrl: EImages.promoBanner4, targetScreen: ERoutes.search, active; true),
//     BannerModel(imageUrl: EImages.promoBanner5, targetScreen: ERoutes.settings, active; true),
//     BannerModel(imageUrl: EImages.promoBanner6, targetScreen: ERoutes.userAddress, active; true),
//     BannerModel(imageUrl: EImages.promoBanner7, targetScreen: ERoutes.checkout, active; false),
//   ];

//   /// --- USERS
//   static final UserModel user = UserModel(
//     // id: id,
//     // userName: userName,
//     email: 'hdh.trung96@gmail.com',
//     firstName: 'Trung',
//     lastName: 'Hoang',
//     phoneNumber: '09876543210',
//     profilePicture: EImages.user,
//     addresses: [
//       AddressModel(
//         id: '1',
//         name: 'Coding with T',
//         phoneNumber: '+923178059528',
//         street: '82356 Timmy Coves',
//         city: 'South Liana',
//         state: 'Maine',
//         postalCode: '87665',
//         country: 'USA',
//       ),
//     ],
//   );

//   / --- CARTS
//   static final CartModel cart = CartModel(
//     cartId: '001',
//     items: [
//       CartItemModel(
//         productId: '001',
//         variationId: '1',
//         quantity: 1,
//         title: products[0].title,
//         image: products[0].thumbnail,
//         brandName: products[0].brand!.name,
//         price: products[0].productVariations![0].price,
//         selectedVariation: products[0].productVariations![0].attributeValues,
//       ),
//     ],
//   );

//   / --- ORDERS
//   static final List<OrderModel> orders = [
//     OrderModel(
//       id: 'CWT0012',
//       status: OrderStatus.processing,
//       items: cart.items,
//       totalAmount: 265,
//       orderDate: DateTime(2023, 09, 1),
//       deliveryDate: DateTime(2023, 09,9),
//     ),
//   ];

//   /* ----------------------------------------------------------------------- */
//   /*                          List of all Categories                         */
//   /* ----------------------------------------------------------------------- */

//   static String cSports = 'sports';
//   //!!!

//   static String cFurniture = 'furniture';
//   //!!!

//   static String cElectronics = 'electronics';
//   //!!!

//   static String cClothes = 'clothes';
//   //!!!

//   static String cAnimals = 'animals';
//   //!!!

//   static String cShoes = 'shoes';
//   static String bAdidas = 'adidas';
//   static String bNike = 'nike';
//   static String bPuma = 'puma';
//   static String bSkechers = 'skechers';

//   static String cCosmetics = 'cosmetics';
//   //!!!

//   static String cJewellery = 'jewellery';
//   //!!!

//   static String cToys = 'toys';
//   static String bBandai = 'bandai';
//   static String bKotobukiya = 'kotobukiya';
//   static String bLego = 'lego';
//   static String bSchleich = 'schleich';

//   /* ------------------------------ Categories ----------------------------- */

//   static final List<CategoryModel> categories = [
//     CategoryModel(id: cSports, image: EImages.sportsIcon, name: ETexts.sports, isFeatured: true),
//     CategoryModel(id: cFurniture, image: EImages.furnitureIcon, name: ETexts.furniture, isFeatured: true),
//     CategoryModel(id: cElectronics, image: EImages.electronicsIcon, name: ETexts.electronics, isFeatured: true),
//     CategoryModel(id: cClothes, image: EImages.clothesIcon, name: ETexts.clothes, isFeatured: true),
//     CategoryModel(id: cAnimals, image: EImages.animalsIcon, name: ETexts.animals, isFeatured: true),
//     CategoryModel(id: cShoes, image: EImages.shoesIcon, name: ETexts.shoes, isFeatured: true),
//     CategoryModel(id: cCosmetics, image: EImages.cosmeticsIcon, name: ETexts.cosmetics, isFeatured: true),
//     CategoryModel(id: cJewellery, image: EImages.jewelleryIcon, name: ETexts.jewellery, isFeatured: true),
//     CategoryModel(id: cToys, image: EImages.toysIcon, name: ETexts.toys, isFeatured: true),

//     /* ----------------------- Sub-Categories (Sports) --------------------- */

//     //!!!

//     /* --------------------- Sub-Categories (Furniture) -------------------- */

//     //!!!

//     /* -------------------- Sub-Categories (Electronics) ------------------- */

//     //!!!

//     /* ---------------------- Sub-Categories (Clothes) --------------------- */

//     //!!!

//     /* ---------------------- Sub-Categories (Animals) --------------------- */

//     //!!!

//     /* ----------------------- Sub-Categories (Shoes) ---------------------- */

//     CategoryModel(id: '$cShoes-$bAdidas', image: EImages.productShoesAdidas, name: ETexts.brandAdidas, parentId: cShoes, isFeatured: true),
//     CategoryModel(id: '$cShoes-$bNike', image: EImages.productShoesNike, name: ETexts.brandNike, parentId: cShoes, isFeatured: true),
//     CategoryModel(id: '$cShoes-$bPuma', image: EImages.productShoesPuma, name: ETexts.brandPuma, parentId: cShoes, isFeatured: true),
//     CategoryModel(id: '$cShoes-$bSkechers', image: EImages.productShoesSkechers, name: ETexts.brandSkechers, parentId: cShoes, isFeatured: true),

//     /* --------------------- Sub-Categories (Cosmetics) -------------------- */

//     //!!!

//     /* --------------------- Sub-Categories (Jewellery) -------------------- */

//     //!!!

//     /* ----------------------- Sub-Categories (Toys) ----------------------- */

//     CategoryModel(id: '$cToys-$bBandai', image: EImages.productToysBandai, name: ETexts.brandBandai, parentId: cToys, isFeatured: true),
//     CategoryModel(id: '$cToys-$bKotobukiya', image: EImages.productToysKotobukiya, name: ETexts.brandKotobukiya, parentId: cToys, isFeatured: true),
//     CategoryModel(id: '$cToys-$bLego', image: EImages.productToysLego, name: ETexts.brandLego, parentId: cToys, isFeatured: true),
//     CategoryModel(id: '$cToys-$bSchleich', image: EImages.productToysSchleich, name: ETexts.brandSchleich, parentId: cToys, isFeatured: true),
//   ];

//   /* ----------------------------------------------------------------------- */
//   /*                            List of all Brands                           */
//   /* ----------------------------------------------------------------------- */

//   static final List<BrandModel> brands = [
//     // --- Sports

//     // --- Furniture
    
//     // --- Electronics
    
//     // --- Clothes
    
//     // --- Animals
    
//     // --- Shoes
//     BrandModel(id: bAdidas, EImages.productShoesAdidas, name: ETexts.brandAdidas, productsCount: 265, isFeatured: true),
//     BrandModel(id: bNike, EImages.productShoesNike, name: ETexts.brandNike, productsCount: 95, isFeatured: true),
//     BrandModel(id: bPuma, EImages.productShoesPuma, name: ETexts.brandPuma, productsCount: 36, isFeatured: true),
//     BrandModel(id: bSkechers, EImages.productShoesSkechers, name: ETexts.brandSkechers, productsCount: 45, isFeatured: true),
    
//     // --- Cosmetics
    
//     // --- Jewellery
    
//     // --- Toys
//     BrandModel(id: bBandai, EImages.productToysBandai, name: ETexts.brandBandai, productsCount: 142, isFeatured: true),
//     BrandModel(id: bKotobukiya, EImages.productToysKotobukiya, name: ETexts.brandKotobukiya, productsCount: 361, isFeatured: true),
//     BrandModel(id: bLego, EImages.productToysLego, name: ETexts.brandLego, productsCount: 94, isFeatured: true),
//     BrandModel(id: bSchleich, EImages.productToysSchleich, name: ETexts.brandSchleich, productsCount: 17, isFeatured: true),
//   ];

//   BrandModel bmAdidas = brands[0];
//   BrandModel bmNike = brands[1];
//   BrandModel bmPuma = brands[2];
//   BrandModel bmSkechers = brands[3];
//   BrandModel bmBandai = brands[4];
//   BrandModel bmKotobukiya = brands[5];
//   BrandModel bmLego = brands[6];
//   BrandModel bmSchleich = brands[7];

//   /* ----------------------------------------------------------------------- */
//   /*                       List of all Brand Categories                      */
//   /* ----------------------------------------------------------------------- */

//   static final List<BrandCategoryModel> brandCategory = [
//     // --- Sports
    
//     // --- Furniture
    
//     // --- Electronics
    
//     // --- Clothes
    
//     // --- Animals
    
//     // --- Shoes
//     BrandCategoryModel(brandId: bAdidas, categoryId: cShoes),
//     BrandCategoryModel(brandId: bNike, categoryId: cShoes),
//     BrandCategoryModel(brandId: bPuma, categoryId: cShoes),
//     BrandCategoryModel(brandId: bSkechers, categoryId: cShoes),
    
//     // --- Cosmetics
    
//     // --- Jewellery
    
//     // --- Toys
//     BrandCategoryModel(brandId: bBandai, categoryId: cToys),
//     BrandCategoryModel(brandId: bKotobukiya, categoryId: cToys),
//     BrandCategoryModel(brandId: bLego, categoryId: cToys),
//     BrandCategoryModel(brandId: bSchleich, categoryId: cToys),
//   ];

//   /* ----------------------------------------------------------------------- */
//   /*                      List of all Product Categories                     */
//   /* ----------------------------------------------------------------------- */

//   static final List<ProductCategoryModel> productCategories = [
//     // --- Sports

//     // --- Furniture

//     // --- Electronics

//     // --- Clothes

//     // --- Animals

//     // --- Shoes
//     ProductCategoryModel(productId: '001-$bAdidas', categoryId: cShoes),
//     ProductCategoryModel(productId: '002-$bAdidas', categoryId: cShoes),
//     ProductCategoryModel(productId: '003-$bAdidas', categoryId: cShoes),
//     ProductCategoryModel(productId: '004-$bAdidas', categoryId: cShoes),
//     ProductCategoryModel(productId: '005-$bAdidas', categoryId: cShoes),
//     //
//     ProductCategoryModel(productId: '001-$bNike', categoryId: cShoes),
//     ProductCategoryModel(productId: '002-$bNike', categoryId: cShoes),
//     ProductCategoryModel(productId: '003-$bNike', categoryId: cShoes),
//     ProductCategoryModel(productId: '004-$bNike', categoryId: cShoes),
//     ProductCategoryModel(productId: '005-$bNike', categoryId: cShoes),
//     //
//     ProductCategoryModel(productId: '001-$bPuma', categoryId: cShoes),
//     ProductCategoryModel(productId: '002-$bPuma', categoryId: cShoes),
//     ProductCategoryModel(productId: '003-$bPuma', categoryId: cShoes),
//     ProductCategoryModel(productId: '004-$bPuma', categoryId: cShoes),
//     ProductCategoryModel(productId: '005-$bPuma', categoryId: cShoes),
//     //
//     ProductCategoryModel(productId: '001-$bSkechers', categoryId: cShoes),
//     ProductCategoryModel(productId: '002-$bSkechers', categoryId: cShoes),
//     ProductCategoryModel(productId: '003-$bSkechers', categoryId: cShoes),
//     ProductCategoryModel(productId: '004-$bSkechers', categoryId: cShoes),
//     ProductCategoryModel(productId: '005-$bSkechers', categoryId: cShoes),
    
//     // --- Cosmetics
    
//     // --- Jewellery
    
//     // --- Toys
//     ProductCategoryModel(productId: '001-$bBandai', categoryId: cToys),
//     ProductCategoryModel(productId: '002-$bBandai', categoryId: cToys),
//     ProductCategoryModel(productId: '003-$bBandai', categoryId: cToys),
//     ProductCategoryModel(productId: '004-$bBandai', categoryId: cToys),
//     ProductCategoryModel(productId: '005-$bBandai', categoryId: cToys),
//     //
//     ProductCategoryModel(productId: '001-$bKotobukiya', categoryId: cToys),
//     ProductCategoryModel(productId: '002-$bKotobukiya', categoryId: cToys),
//     ProductCategoryModel(productId: '003-$bKotobukiya', categoryId: cToys),
//     ProductCategoryModel(productId: '004-$bKotobukiya', categoryId: cToys),
//     ProductCategoryModel(productId: '005-$bKotobukiya', categoryId: cToys),
//     //
//     ProductCategoryModel(productId: '001-$bLego', categoryId: cToys),
//     ProductCategoryModel(productId: '002-$bLego', categoryId: cToys),
//     ProductCategoryModel(productId: '003-$bLego', categoryId: cToys),
//     ProductCategoryModel(productId: '004-$bLego', categoryId: cToys),
//     ProductCategoryModel(productId: '005-$bLego', categoryId: cToys),
//     //
//     ProductCategoryModel(productId: '001-$bSchleich', categoryId: cToys),
//     ProductCategoryModel(productId: '002-$bSchleich', categoryId: cToys),
//     ProductCategoryModel(productId: '003-$bSchleich', categoryId: cToys),
//     ProductCategoryModel(productId: '004-$bSchleich', categoryId: cToys),
//     ProductCategoryModel(productId: '005-$bSchleich', categoryId: cToys),
//   ];

//   /* ----------------------------------------------------------------------- */
//   /*                           List of all Products                          */
//   /* ----------------------------------------------------------------------- */

//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '001-$bAdidas',
//       title: 'ADIZERO UBERSONIC 4 TENNIS SHOES',
//       description: '...',
//       sku: '...',
//       //
//       stock: 15,
//       price: 100,
//       salePrice: 70
//       isFeatured: true,
//       //
//       categoryId: cSports,
//       brand: bmAdidas,
//       thumbnail: EImages.productShoesAdidas1,
//       images: [EImages.productShoesAdidas1, EImages.productShoesAdidas11, EImages.productShoesAdidas12, EImages.productShoesAdidas13],
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', value: ['Green', 'Black', 'Red']),
//         ProductAttributeModel(name: 'Size', value: ['EU30', 'EU32', 'EU34']),
//       ],
//       //
//     ),
//   ];
// }
