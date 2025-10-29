import 'package:e_commerce_app/features/shop/models/banner_model.dart';
import 'package:e_commerce_app/features/shop/models/brand_category_model.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';

class EDummyData {
  /* ----------------------------------------------------------------------- */
  /*                          CATEGORY IDS & BRAND IDS                       */
  /* ----------------------------------------------------------------------- */

  // Category IDs
  static const String cSports = 'sports';
  static const String cFurniture = 'furniture';
  static const String cElectronics = 'electronics';
  static const String cClothes = 'clothes';
  static const String cAnimals = 'animals';
  static const String cShoes = 'shoes';
  static const String cCosmetics = 'cosmetics';
  static const String cJewellery = 'jewellery';
  static const String cToys = 'toys';

  // Brand IDs - Sports
  static const String bGiant = 'giant';
  static const String bWilson = 'wilson';
  static const String bYonex = 'yonex';
  static const String bAKpro = 'akpro';
  static const String bSpeedo = 'speedo';

  // Brand IDs - Furniture
  static const String bIKEA = 'ikea';

  // Brand IDs - Shoes
  static const String bAdidas = 'adidas';
  static const String bNike = 'nike';
  static const String bPuma = 'puma';
  static const String bSkechers = 'skechers';

  // Brand IDs - Toys
  static const String bBandai = 'bandai';
  static const String bKotobukiya = 'kotobukiya';
  static const String bLego = 'lego';
  static const String bSchleich = 'schleich';

  /* ----------------------------------------------------------------------- */
  /*                                 BANNERS                                 */
  /* ----------------------------------------------------------------------- */

  static final List<BannerModel> banners = [
    BannerModel(imageUrl: EImages.promoBanner1, targetScreen: ERoutes.order, active: true),
    BannerModel(imageUrl: EImages.promoBanner2, targetScreen: ERoutes.cart, active: true),
    BannerModel(imageUrl: EImages.promoBanner3, targetScreen: ERoutes.favourites, active: true),
    BannerModel(imageUrl: EImages.promoBanner4, targetScreen: ERoutes.search, active: true),
    BannerModel(imageUrl: EImages.promoBanner5, targetScreen: ERoutes.settings, active: true),
  ];

  /* ----------------------------------------------------------------------- */
  /*                               CATEGORIES                                */
  /* ----------------------------------------------------------------------- */

  static final List<CategoryModel> categories = [
    CategoryModel(id: cSports, image: EImages.sportsIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: cFurniture, image: EImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: cElectronics, image: EImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: cClothes, image: EImages.clothesIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: cAnimals, image: EImages.animalsIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: cShoes, image: EImages.shoesIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: cCosmetics, image: EImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: cJewellery, image: EImages.jewelleryIcon, name: 'Jewellery', isFeatured: true),
    CategoryModel(id: cToys, image: EImages.toysIcon, name: 'Toys', isFeatured: true),
  ];

  /* ----------------------------------------------------------------------- */
  /*                                 BRANDS                                  */
  /* ----------------------------------------------------------------------- */

  static final List<BrandModel> brands = [
    // Sports Brands
    BrandModel(id: bGiant, name: 'Giant', image: EImages.productSportsGiant, productsCount: 4, isFeatured: true),
    BrandModel(id: bWilson, name: 'Wilson', image: EImages.productSportsWilson, productsCount: 4, isFeatured: true),
    BrandModel(id: bYonex, name: 'Yonex', image: EImages.productSportsYonex, productsCount: 3, isFeatured: true),
    BrandModel(id: bAKpro, name: 'AKpro', image: EImages.productSportsAKpro, productsCount: 5, isFeatured: true),
    BrandModel(id: bSpeedo, name: 'Speedo', image: EImages.productSportsSpeedo, productsCount: 3, isFeatured: true),

    // Furniture Brands
    BrandModel(id: bIKEA, name: 'IKEA', image: EImages.productFurnitureIKEA, productsCount: 25, isFeatured: true),

    // Shoes Brands
    BrandModel(id: bAdidas, name: 'Adidas', image: EImages.productShoesAdidas, productsCount: 5, isFeatured: true),
    BrandModel(id: bNike, name: 'Nike', image: EImages.productShoesNike, productsCount: 5, isFeatured: true),
    BrandModel(id: bPuma, name: 'Puma', image: EImages.productShoesPuma, productsCount: 5, isFeatured: true),
    BrandModel(id: bSkechers, name: 'Skechers', image: EImages.productShoesSkechers, productsCount: 5, isFeatured: true),

    // Toys Brands
    BrandModel(id: bBandai, name: 'Bandai', image: EImages.productToysBandai, productsCount: 5, isFeatured: true),
    BrandModel(id: bKotobukiya, name: 'Kotobukiya', image: EImages.productToysKotobukiya, productsCount: 5, isFeatured: true),
    BrandModel(id: bLego, name: 'Lego', image: EImages.productToysLego, productsCount: 5, isFeatured: true),
    BrandModel(id: bSchleich, name: 'Schleich', image: EImages.productToysSchleich, productsCount: 5, isFeatured: true),
  ];

  /* ----------------------------------------------------------------------- */
  /*                             BRAND CATEGORIES                            */
  /* ----------------------------------------------------------------------- */

  static final List<BrandCategoryModel> brandCategories = [
    // Sports
    BrandCategoryModel(brandId: bGiant, categoryId: cSports),
    BrandCategoryModel(brandId: bWilson, categoryId: cSports),
    BrandCategoryModel(brandId: bYonex, categoryId: cSports),
    BrandCategoryModel(brandId: bAKpro, categoryId: cSports),
    BrandCategoryModel(brandId: bSpeedo, categoryId: cSports),

    // Furniture
    BrandCategoryModel(brandId: bIKEA, categoryId: cFurniture),

    // Shoes
    BrandCategoryModel(brandId: bAdidas, categoryId: cShoes),
    BrandCategoryModel(brandId: bNike, categoryId: cShoes),
    BrandCategoryModel(brandId: bPuma, categoryId: cShoes),
    BrandCategoryModel(brandId: bSkechers, categoryId: cShoes),

    // Toys
    BrandCategoryModel(brandId: bBandai, categoryId: cToys),
    BrandCategoryModel(brandId: bKotobukiya, categoryId: cToys),
    BrandCategoryModel(brandId: bLego, categoryId: cToys),
    BrandCategoryModel(brandId: bSchleich, categoryId: cToys),
  ];

  /* ----------------------------------------------------------------------- */
  /*                            PRODUCT CATEGORIES                           */
  /* ----------------------------------------------------------------------- */

  static final List<ProductCategoryModel> productCategories = [
    // Sports - Giant
    ProductCategoryModel(productId: '001', categoryId: cSports),
    ProductCategoryModel(productId: '002', categoryId: cSports),
    ProductCategoryModel(productId: '003', categoryId: cSports),
    ProductCategoryModel(productId: '004', categoryId: cSports),

    // Sports - Wilson
    ProductCategoryModel(productId: '005', categoryId: cSports),
    ProductCategoryModel(productId: '006', categoryId: cSports),
    ProductCategoryModel(productId: '007', categoryId: cSports),
    ProductCategoryModel(productId: '008', categoryId: cSports),

    // Sports - Yonex
    ProductCategoryModel(productId: '009', categoryId: cSports),
    ProductCategoryModel(productId: '010', categoryId: cSports),
    ProductCategoryModel(productId: '011', categoryId: cSports),

    // Sports - AKpro
    ProductCategoryModel(productId: '012', categoryId: cSports),
    ProductCategoryModel(productId: '013', categoryId: cSports),
    ProductCategoryModel(productId: '014', categoryId: cSports),
    ProductCategoryModel(productId: '015', categoryId: cSports),
    ProductCategoryModel(productId: '016', categoryId: cSports),

    // Sports - Speedo
    ProductCategoryModel(productId: '017', categoryId: cSports),
    ProductCategoryModel(productId: '018', categoryId: cSports),
    ProductCategoryModel(productId: '019', categoryId: cSports),

    // Furniture - IKEA
    ProductCategoryModel(productId: '020', categoryId: cFurniture),
    ProductCategoryModel(productId: '021', categoryId: cFurniture),
    ProductCategoryModel(productId: '022', categoryId: cFurniture),

    // Shoes - Nike
    ProductCategoryModel(productId: '023', categoryId: cShoes),
    ProductCategoryModel(productId: '024', categoryId: cShoes),
    ProductCategoryModel(productId: '025', categoryId: cShoes),

    // Shoes - Adidas
    ProductCategoryModel(productId: '026', categoryId: cShoes),
    ProductCategoryModel(productId: '027', categoryId: cShoes),
    ProductCategoryModel(productId: '028', categoryId: cShoes),

    // Shoes - Skechers
    ProductCategoryModel(productId: '029', categoryId: cShoes),
    ProductCategoryModel(productId: '030', categoryId: cShoes),
    ProductCategoryModel(productId: '031', categoryId: cShoes),

    // Shoes - Puma
    ProductCategoryModel(productId: '032', categoryId: cShoes),
    ProductCategoryModel(productId: '033', categoryId: cShoes),
    ProductCategoryModel(productId: '034', categoryId: cShoes),

    // Toys - Lego
    ProductCategoryModel(productId: '035', categoryId: cToys),
    ProductCategoryModel(productId: '036', categoryId: cToys),
    ProductCategoryModel(productId: '037', categoryId: cToys),

    // Toys - Schleich
    ProductCategoryModel(productId: '038', categoryId: cToys),
    ProductCategoryModel(productId: '039', categoryId: cToys),
    ProductCategoryModel(productId: '040', categoryId: cToys),

    // Toys - Bandai
    ProductCategoryModel(productId: '041', categoryId: cToys),
    ProductCategoryModel(productId: '042', categoryId: cToys),
    ProductCategoryModel(productId: '043', categoryId: cToys),

    // Toys - Kotobukiya
    ProductCategoryModel(productId: '044', categoryId: cToys),
    ProductCategoryModel(productId: '045', categoryId: cToys),
    ProductCategoryModel(productId: '046', categoryId: cToys),
  ];

  /* ----------------------------------------------------------------------- */
  /*                                PRODUCTS                                 */
  /* ----------------------------------------------------------------------- */

  static final List<ProductModel> products = [
    /* ----------------------------- Sports - Giant -------------------------- */
    ProductModel(
      id: '001',
      title: 'Giant XTC Advanced 29 3 - Mountain Bike',
      stock: 15,
      price: 3500,
      isFeatured: true,
      thumbnail: EImages.productSportsGiant1,
      description: 'High-performance mountain bike for professional riders',
      brand: BrandModel(id: bGiant, name: 'Giant', image: EImages.productSportsGiant),
      images: [EImages.productSportsGiant1],
      salePrice: 3200,
      sku: 'GNT-MTB-001',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '002',
      title: 'Momentum iNeed Latte 26 - Touring Bike',
      stock: 20,
      price: 800,
      isFeatured: true,
      thumbnail: EImages.productSportsGiant2,
      description: 'Comfortable touring bike for daily commute',
      brand: BrandModel(id: bGiant, name: 'Giant', image: EImages.productSportsGiant),
      images: [EImages.productSportsGiant2],
      salePrice: 750,
      sku: 'GNT-TRG-002',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Giant TCR Advanced 1+ Disc - Road Bike',
      stock: 10,
      price: 4200,
      isFeatured: true,
      thumbnail: EImages.productSportsGiant3,
      description: 'Professional road racing bike with disc brakes',
      brand: BrandModel(id: bGiant, name: 'Giant', image: EImages.productSportsGiant),
      images: [EImages.productSportsGiant3],
      salePrice: 3999,
      sku: 'GNT-RD-003',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: 'Momentum Pakaway 1 - Folding Bike',
      stock: 25,
      price: 650,
      isFeatured: false,
      thumbnail: EImages.productSportsGiant4,
      description: 'Compact folding bike perfect for urban travel',
      brand: BrandModel(id: bGiant, name: 'Giant', image: EImages.productSportsGiant),
      images: [EImages.productSportsGiant4],
      salePrice: 600,
      sku: 'GNT-FLD-004',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),

    /* ---------------------------- Sports - Wilson -------------------------- */
    ProductModel(
      id: '005',
      title: 'Wilson Clash 100 Pro V2 Tennis Racket',
      stock: 30,
      price: 250,
      isFeatured: true,
      thumbnail: EImages.productSportsWilson1,
      description: 'Professional tennis racket with excellent control',
      brand: BrandModel(id: bWilson, name: 'Wilson', image: EImages.productSportsWilson),
      images: [EImages.productSportsWilson1],
      salePrice: 230,
      sku: 'WLS-TNS-005',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '006',
      title: 'Wilson Roland-Garros Clash 100 V2',
      stock: 20,
      price: 270,
      isFeatured: false,
      thumbnail: EImages.productSportsWilson2,
      description: 'Limited edition Roland-Garros tennis racket',
      brand: BrandModel(id: bWilson, name: 'Wilson', image: EImages.productSportsWilson),
      images: [EImages.productSportsWilson2],
      salePrice: 250,
      sku: 'WLS-TNS-006',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'Wilson Ultra 100L V4 Tennis Racket',
      stock: 25,
      price: 220,
      isFeatured: false,
      thumbnail: EImages.productSportsWilson3,
      description: 'Lightweight tennis racket for aggressive play',
      brand: BrandModel(id: bWilson, name: 'Wilson', image: EImages.productSportsWilson),
      images: [EImages.productSportsWilson3],
      salePrice: 200,
      sku: 'WLS-TNS-007',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '008',
      title: 'Wilson Pro Staff 97 V14 Tennis Racket',
      stock: 15,
      price: 280,
      isFeatured: true,
      thumbnail: EImages.productSportsWilson4,
      description: 'Professional grade tennis racket for advanced players',
      brand: BrandModel(id: bWilson, name: 'Wilson', image: EImages.productSportsWilson),
      images: [EImages.productSportsWilson4],
      salePrice: 260,
      sku: 'WLS-TNS-008',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),

    /* ---------------------------- Sports - Yonex --------------------------- */
    ProductModel(
      id: '009',
      title: 'Yonex Astrox 88S Play Badminton Racket',
      stock: 40,
      price: 180,
      isFeatured: true,
      thumbnail: EImages.productSportsYonex1,
      description: 'Lightweight badminton racket for speed and control',
      brand: BrandModel(id: bYonex, name: 'Yonex', image: EImages.productSportsYonex),
      images: [EImages.productSportsYonex1],
      salePrice: 165,
      sku: 'YNX-BDM-009',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '010',
      title: 'Yonex Nanoflare-002 Clear Badminton Racket',
      stock: 35,
      price: 200,
      isFeatured: false,
      thumbnail: EImages.productSportsYonex2,
      description: 'Ultra-light racket with exceptional repulsion power',
      brand: BrandModel(id: bYonex, name: 'Yonex', image: EImages.productSportsYonex),
      images: [EImages.productSportsYonex2],
      salePrice: 185,
      sku: 'YNX-BDM-010',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '011',
      title: 'Yonex NF Ability Badminton Racket',
      stock: 30,
      price: 160,
      isFeatured: false,
      thumbnail: EImages.productSportsYonex3,
      description: 'Versatile badminton racket for all-around play',
      brand: BrandModel(id: bYonex, name: 'Yonex', image: EImages.productSportsYonex),
      images: [EImages.productSportsYonex3],
      salePrice: 145,
      sku: 'YNX-BDM-011',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),

    /* ---------------------------- Sports - AKpro --------------------------- */
    ProductModel(
      id: '012',
      title: 'AKpro ABX3 Basketball - Size 5',
      stock: 50,
      price: 35,
      isFeatured: false,
      thumbnail: EImages.productSportsAKpro1,
      description: 'Professional leather basketball',
      brand: BrandModel(id: bAKpro, name: 'AKpro', image: EImages.productSportsAKpro),
      images: [EImages.productSportsAKpro1],
      salePrice: 30,
      sku: 'AKP-BBL-012',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '013',
      title: 'AKpro AB6006 Basketball - Size 7',
      stock: 45,
      price: 40,
      isFeatured: true,
      thumbnail: EImages.productSportsAKpro2,
      description: 'Official size leather basketball',
      brand: BrandModel(id: bAKpro, name: 'AKpro', image: EImages.productSportsAKpro),
      images: [EImages.productSportsAKpro2],
      salePrice: 36,
      sku: 'AKP-BBL-013',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '014',
      title: 'Molten BG3200 Basketball - Size 6',
      stock: 40,
      price: 55,
      isFeatured: false,
      thumbnail: EImages.productSportsAKpro3,
      description: 'Premium quality leather basketball',
      brand: BrandModel(id: bAKpro, name: 'AKpro', image: EImages.productSportsAKpro),
      images: [EImages.productSportsAKpro3],
      salePrice: 50,
      sku: 'AKP-BBL-014',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '015',
      title: 'AKpro AB8008 Basketball - Size 7',
      stock: 35,
      price: 45,
      isFeatured: false,
      thumbnail: EImages.productSportsAKpro4,
      description: 'Durable leather basketball for outdoor use',
      brand: BrandModel(id: bAKpro, name: 'AKpro', image: EImages.productSportsAKpro),
      images: [EImages.productSportsAKpro4],
      salePrice: 40,
      sku: 'AKP-BBL-015',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '016',
      title: 'AKpro AB5000 Rubber Basketball - Size 7',
      stock: 60,
      price: 25,
      isFeatured: false,
      thumbnail: EImages.productSportsAKpro5,
      description: 'Affordable rubber basketball for practice',
      brand: BrandModel(id: bAKpro, name: 'AKpro', image: EImages.productSportsAKpro),
      images: [EImages.productSportsAKpro5],
      salePrice: 22,
      sku: 'AKP-BBL-016',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),

    /* --------------------------- Sports - Speedo --------------------------- */
    ProductModel(
      id: '017',
      title: 'Speedo Biofuse Infant Goggle - Pink',
      stock: 45,
      price: 28,
      isFeatured: false,
      thumbnail: EImages.productSportsSpeedo1,
      description: 'Comfortable swimming goggles for children',
      brand: BrandModel(id: bSpeedo, name: 'Speedo', image: EImages.productSportsSpeedo),
      images: [EImages.productSportsSpeedo1],
      salePrice: 25,
      sku: 'SPD-GGL-017',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '018',
      title: 'Speedo Fastskin Pure Focus Mirror Goggles',
      stock: 30,
      price: 85,
      isFeatured: true,
      thumbnail: EImages.productSportsSpeedo2,
      description: 'Professional racing goggles with mirror lens',
      brand: BrandModel(id: bSpeedo, name: 'Speedo', image: EImages.productSportsSpeedo),
      images: [EImages.productSportsSpeedo2],
      salePrice: 78,
      sku: 'SPD-GGL-018',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '019',
      title: 'Speedo Rift Junior Goggle - Blue',
      stock: 50,
      price: 32,
      isFeatured: false,
      thumbnail: EImages.productSportsSpeedo3,
      description: 'Durable swimming goggles for young swimmers',
      brand: BrandModel(id: bSpeedo, name: 'Speedo', image: EImages.productSportsSpeedo),
      images: [EImages.productSportsSpeedo3],
      salePrice: 28,
      sku: 'SPD-GGL-019',
      categoryId: cSports,
      productType: 'ProductType.single',
    ),

    /* -------------------------- Furniture - IKEA --------------------------- */
    ProductModel(
      id: '020',
      title: 'IKEA Gaming Chair - Dark Grey',
      stock: 12,
      price: 299,
      isFeatured: true,
      thumbnail: EImages.productFurnitureIKEA17,
      description: 'Ergonomic gaming chair with adjustable features',
      brand: BrandModel(id: bIKEA, name: 'IKEA', image: EImages.productFurnitureIKEA),
      images: [EImages.productFurnitureIKEA17],
      salePrice: 269,
      sku: 'IKEA-CHR-020',
      categoryId: cFurniture,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '021',
      title: 'IKEA Coffee Table - Oak Veneer 140x60cm',
      stock: 18,
      price: 159,
      isFeatured: true,
      thumbnail: EImages.productFurnitureIKEA11,
      description: 'Modern coffee table with oak veneer finish',
      brand: BrandModel(id: bIKEA, name: 'IKEA', image: EImages.productFurnitureIKEA),
      images: [EImages.productFurnitureIKEA11],
      salePrice: 139,
      sku: 'IKEA-TBL-021',
      categoryId: cFurniture,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '022',
      title: 'IKEA Corner Sofa-bed with Storage',
      stock: 8,
      price: 899,
      isFeatured: true,
      thumbnail: EImages.productFurnitureIKEA12,
      description: 'Multi-functional sofa-bed with built-in storage',
      brand: BrandModel(id: bIKEA, name: 'IKEA', image: EImages.productFurnitureIKEA),
      images: [EImages.productFurnitureIKEA12],
      salePrice: 799,
      sku: 'IKEA-SFA-022',
      categoryId: cFurniture,
      productType: 'ProductType.single',
    ),

    /* ---------------------------- Shoes - Nike ----------------------------- */
    ProductModel(
      id: '023',
      title: 'Nike Air Jordan 1 Mid',
      stock: 30,
      price: 130,
      isFeatured: true,
      thumbnail: EImages.productShoesNike1,
      description: 'Iconic basketball-inspired sneakers',
      brand: BrandModel(id: bNike, name: 'Nike', image: EImages.productShoesNike),
      images: [EImages.productShoesNike1],
      salePrice: 115,
      sku: 'NK-SH-023',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '024',
      title: 'Nike Jumpman MVP',
      stock: 25,
      price: 140,
      isFeatured: true,
      thumbnail: EImages.productShoesNike2,
      description: 'Performance basketball shoes',
      brand: BrandModel(id: bNike, name: 'Nike', image: EImages.productShoesNike),
      images: [EImages.productShoesNike2],
      salePrice: 125,
      sku: 'NK-SH-024',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '025',
      title: 'Nike Dunk Low Twist',
      stock: 20,
      price: 120,
      isFeatured: true,
      thumbnail: EImages.productShoesNike3,
      description: 'Stylish casual sneakers',
      brand: BrandModel(id: bNike, name: 'Nike', image: EImages.productShoesNike),
      images: [EImages.productShoesNike3],
      salePrice: 105,
      sku: 'NK-SH-025',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),

    /* --------------------------- Shoes - Adidas ---------------------------- */
    ProductModel(
      id: '026',
      title: 'Adidas Adizero Ubersonic 4 Tennis Shoes',
      stock: 28,
      price: 150,
      isFeatured: true,
      thumbnail: EImages.productShoesAdidas1,
      description: 'Professional tennis shoes for speed and agility',
      brand: BrandModel(id: bAdidas, name: 'Adidas', image: EImages.productShoesAdidas),
      images: [EImages.productShoesAdidas1],
      salePrice: 135,
      sku: 'AD-SH-026',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '027',
      title: 'Adidas Barricade 13 Tennis Shoes',
      stock: 22,
      price: 160,
      isFeatured: false,
      thumbnail: EImages.productShoesAdidas3,
      description: 'Durable tennis shoes with excellent support',
      brand: BrandModel(id: bAdidas, name: 'Adidas', image: EImages.productShoesAdidas),
      images: [EImages.productShoesAdidas3],
      salePrice: 145,
      sku: 'AD-SH-027',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '028',
      title: 'Adidas Osade Shoes',
      stock: 35,
      price: 95,
      isFeatured: false,
      thumbnail: EImages.productShoesAdidas4,
      description: 'Comfortable lifestyle sneakers',
      brand: BrandModel(id: bAdidas, name: 'Adidas', image: EImages.productShoesAdidas),
      images: [EImages.productShoesAdidas4],
      salePrice: 85,
      sku: 'AD-SH-028',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),

    /* -------------------------- Shoes - Skechers --------------------------- */
    ProductModel(
      id: '029',
      title: 'Skechers Arch Fit Foamies - Beach Escape',
      stock: 40,
      price: 65,
      isFeatured: false,
      thumbnail: EImages.productShoesSkechers1,
      description: 'Ultra-comfortable foam sandals',
      brand: BrandModel(id: bSkechers, name: 'Skechers', image: EImages.productShoesSkechers),
      images: [EImages.productShoesSkechers1],
      salePrice: 58,
      sku: 'SK-SH-029',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '030',
      title: 'Skechers Foamies Creston Ultra',
      stock: 45,
      price: 70,
      isFeatured: true,
      thumbnail: EImages.productShoesSkechers2,
      description: 'Lightweight slip-on shoes',
      brand: BrandModel(id: bSkechers, name: 'Skechers', image: EImages.productShoesSkechers),
      images: [EImages.productShoesSkechers2],
      salePrice: 63,
      sku: 'SK-SH-030',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '031',
      title: 'Skechers GOwalk Arch Fit - Mission II',
      stock: 38,
      price: 85,
      isFeatured: false,
      thumbnail: EImages.productShoesSkechers3,
      description: 'Walking shoes with arch support',
      brand: BrandModel(id: bSkechers, name: 'Skechers', image: EImages.productShoesSkechers),
      images: [EImages.productShoesSkechers3],
      salePrice: 75,
      sku: 'SK-SH-031',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),

    /* ---------------------------- Shoes - Puma ----------------------------- */
    ProductModel(
      id: '032',
      title: 'Puma Future 7 Match Rush Turf Trainer',
      stock: 25,
      price: 110,
      isFeatured: true,
      thumbnail: EImages.productShoesPuma1,
      description: 'Soccer cleats for turf surfaces',
      brand: BrandModel(id: bPuma, name: 'Puma', image: EImages.productShoesPuma),
      images: [EImages.productShoesPuma1],
      salePrice: 98,
      sku: 'PM-SH-032',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '033',
      title: 'Puma Future 7 Pro FG/AG Soccer Cleats',
      stock: 20,
      price: 180,
      isFeatured: false,
      thumbnail: EImages.productShoesPuma2,
      description: 'Professional soccer cleats',
      brand: BrandModel(id: bPuma, name: 'Puma', image: EImages.productShoesPuma),
      images: [EImages.productShoesPuma2],
      salePrice: 165,
      sku: 'PM-SH-033',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '034',
      title: 'Puma King Ultimate Rush FG/AG',
      stock: 18,
      price: 200,
      isFeatured: false,
      thumbnail: EImages.productShoesPuma4,
      description: 'Premium leather soccer cleats',
      brand: BrandModel(id: bPuma, name: 'Puma', image: EImages.productShoesPuma),
      images: [EImages.productShoesPuma4],
      salePrice: 180,
      sku: 'PM-SH-034',
      categoryId: cShoes,
      productType: 'ProductType.single',
    ),

    /* ----------------------------- Toys - Lego ----------------------------- */
    ProductModel(
      id: '035',
      title: 'LEGO Aston Martin Safety Car & AMR23',
      stock: 15,
      price: 199,
      isFeatured: true,
      thumbnail: EImages.productToysLego1,
      description: 'LEGO Formula 1 racing car set',
      brand: BrandModel(id: bLego, name: 'Lego', image: EImages.productToysLego),
      images: [EImages.productToysLego1],
      salePrice: 179,
      sku: 'LG-TY-035',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '036',
      title: 'LEGO Dungeons & Dragons - Red Dragon\'s Tale',
      stock: 12,
      price: 359,
      isFeatured: true,
      thumbnail: EImages.productToysLego2,
      description: 'Epic D&D LEGO adventure set',
      brand: BrandModel(id: bLego, name: 'Lego', image: EImages.productToysLego),
      images: [EImages.productToysLego2],
      salePrice: 329,
      sku: 'LG-TY-036',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '037',
      title: 'LEGO Hogwarts Castle - The Great Hall',
      stock: 10,
      price: 449,
      isFeatured: true,
      thumbnail: EImages.productToysLego3,
      description: 'Harry Potter Hogwarts Castle LEGO set',
      brand: BrandModel(id: bLego, name: 'Lego', image: EImages.productToysLego),
      images: [EImages.productToysLego3],
      salePrice: 399,
      sku: 'LG-TY-037',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),

    /* --------------------------- Toys - Schleich --------------------------- */
    ProductModel(
      id: '038',
      title: 'Schleich Bayala Rainbow Dragon',
      stock: 25,
      price: 45,
      isFeatured: false,
      thumbnail: EImages.productToysSchleich1,
      description: 'Fantasy rainbow dragon figure',
      brand: BrandModel(id: bSchleich, name: 'Schleich', image: EImages.productToysSchleich),
      images: [EImages.productToysSchleich1],
      salePrice: 40,
      sku: 'SC-TY-038',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '039',
      title: 'Schleich Bayala Llamacorn',
      stock: 30,
      price: 38,
      isFeatured: false,
      thumbnail: EImages.productToysSchleich2,
      description: 'Magical llamacorn fantasy figure',
      brand: BrandModel(id: bSchleich, name: 'Schleich', image: EImages.productToysSchleich),
      images: [EImages.productToysSchleich2],
      salePrice: 35,
      sku: 'SC-TY-039',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '040',
      title: 'Schleich Eldrador Shadow Wolf',
      stock: 28,
      price: 42,
      isFeatured: true,
      thumbnail: EImages.productToysSchleich3,
      description: 'Eldrador creatures shadow wolf figure',
      brand: BrandModel(id: bSchleich, name: 'Schleich', image: EImages.productToysSchleich),
      images: [EImages.productToysSchleich3],
      salePrice: 38,
      sku: 'SC-TY-040',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),

    /* --------------------------- Toys - Bandai ----------------------------- */
    ProductModel(
      id: '041',
      title: 'Gundam Universe RX-78-2 Gundam',
      stock: 20,
      price: 65,
      isFeatured: true,
      thumbnail: EImages.productToysBandai1,
      description: 'Iconic RX-78-2 Gundam action figure',
      brand: BrandModel(id: bBandai, name: 'Bandai', image: EImages.productToysBandai),
      images: [EImages.productToysBandai1],
      salePrice: 58,
      sku: 'BD-TY-041',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '042',
      title: 'HG 1:144 Gundam Lfrith Pre-Production Model',
      stock: 18,
      price: 35,
      isFeatured: false,
      thumbnail: EImages.productToysBandai2,
      description: 'High Grade Gundam model kit',
      brand: BrandModel(id: bBandai, name: 'Bandai', image: EImages.productToysBandai),
      images: [EImages.productToysBandai2],
      salePrice: 32,
      sku: 'BD-TY-042',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '043',
      title: 'PG 1:60 Unicorn Gundam 03 Phenex',
      stock: 8,
      price: 299,
      isFeatured: true,
      thumbnail: EImages.productToysBandai3,
      description: 'Perfect Grade Unicorn Gundam Phenex',
      brand: BrandModel(id: bBandai, name: 'Bandai', image: EImages.productToysBandai),
      images: [EImages.productToysBandai3],
      salePrice: 279,
      sku: 'BD-TY-043',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),

    /* ------------------------- Toys - Kotobukiya --------------------------- */
    ProductModel(
      id: '044',
      title: 'ARTFX J Io Cuddling the Sword',
      stock: 12,
      price: 149,
      isFeatured: false,
      thumbnail: EImages.productToysKotobukiya1,
      description: 'Premium anime character figure',
      brand: BrandModel(id: bKotobukiya, name: 'Kotobukiya', image: EImages.productToysKotobukiya),
      images: [EImages.productToysKotobukiya1],
      salePrice: 135,
      sku: 'KT-TY-044',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '045',
      title: 'ARTFX J Izuku Midoriya Dark Deku Ver.',
      stock: 15,
      price: 159,
      isFeatured: true,
      thumbnail: EImages.productToysKotobukiya2,
      description: 'My Hero Academia Dark Deku figure',
      brand: BrandModel(id: bKotobukiya, name: 'Kotobukiya', image: EImages.productToysKotobukiya),
      images: [EImages.productToysKotobukiya2],
      salePrice: 145,
      sku: 'KT-TY-045',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '046',
      title: 'ARTFX J Kyojuro Rengoku',
      stock: 10,
      price: 169,
      isFeatured: true,
      thumbnail: EImages.productToysKotobukiya3,
      description: 'Demon Slayer Rengoku premium figure',
      brand: BrandModel(id: bKotobukiya, name: 'Kotobukiya', image: EImages.productToysKotobukiya),
      images: [EImages.productToysKotobukiya3],
      salePrice: 155,
      sku: 'KT-TY-046',
      categoryId: cToys,
      productType: 'ProductType.single',
    ),
  ];
}
