# e_commerce_app

> <u>Nguồn tham khảo</u>: [Professional Flutter E-Commerce App with Firebase as Backend 2024](https://www.youtube.com/playlist?list=PL5jb9EteFAOAusKTSuJ5eRl1BapQmMDT6).
>
> ---
>
> <u>Dự án có 3 phần chính</u>:
> 1. `App Configuration`
> 2. `UI Design`
> 3. `Backend`

---
---
---

## Phần I. App Configuration:

> - Setup Folder Structure.
> - Setup Light & Dark Theme.
> - Essential Utilities.
> - Helper Functions.
> - Constants.
>
> ---
>
> <u>Nguồn</u>:
> - [Efficient Folder Structures for Large Flutter Apps | Feature-First vs. Module-First Approach](https://www.youtube.com/watch?v=QDhaK7L09qI).
> - [Professional Setup of a Theme in Flutter | Light and Dark theme Flutter](https://www.youtube.com/watch?v=Ct9CrMegezQ).
> - [Mastering Flutter: Essential Utilities, Helper Functions, Constants and much more](https://www.youtube.com/watch?v=3StjTeWs-ZQ).
>
> ---
>
> `1.` Create Asset folder.
> - Nơi để chúng ta đặt mọi thứ liên quan đến: *"icons, images, logos, fonts, ..."*
> - Và khai báo các đường dẫn thư mục trên cho file `pubspec.yaml`.
>
> `2.` Setting up Packages and Dependencies.
> - Sử dụng gói [GetX](https://pub.dev/packages/get) để **[ State Manager ]**.
> - Sử dụng gói [Cupertino Icons](https://pub.dev/packages/cupertino_icons) để dùng các Icon theo thiết kế **[ Cupertino ]**.
> - Sử dụng gói [Iconsax](https://pub.dev/packages/iconsax) để dùng các Icon của **[ Framework Vuesax ]**.
> - ...
> - Gói [HTTP](https://pub.dev/packages/http).
> - Gói [Intl](https://pub.dev/packages/intl).
> - Gói [Logger](https://pub.dev/packages/logger).
> - Gói [URL Launcher](https://pub.dev/packages/url_launcher).
> - Gói [Get Storage](https://pub.dev/packages/get_storage).
> - ...
> - Gói [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash).
> - Gói [Smooth Page Indicator](https://pub.dev/packages/smooth_page_indicator).
> - Gói [Carousel Slider](https://pub.dev/packages/carousel_slider).
>
> `3.` Create folders using *"feature first"* approach.
> - Tiếp cận theo hướng *"tính năng"* trước và *"lớp"* sau.
> - Với mỗi *"tính năng"* được chia thành 3 *"lớp"* theo mô hình `MVC`:
>   - `models`
>   - `screens (views)`
>   - `controllers`
>
> ---
>
> **[!]** Cấu trúc thư mục của một dự án nhìn chung sẽ gồm:
>   - `[bindings]` - các ràng buộc với **[ State Manager ]**.
>   - `[common]` - các thứ có thể xài chung như:
>     - `[styles]` - các kiểu cho phông chữ.
>     - `[widgets]` - các Widget tuỳ chỉnh riêng hay dùng.
>   - `[data]` - đây là *"lớp dữ liệu"* gồm 'KHO LƯU TRỮ' và 'DỊCH VỤ'.<br>Cả 2 đều sẽ xử lý các *"truy vấn đám mây" (Cloud Queries)*.<br>Ví dụ sử dụng **[ Cloud Firestore ]** của **[ Firebase ]**.
>     - `[repositories]` - KHO LƯU TRỮ xử lý đẩy/lấy data với Cloud.
>     - `[services]` - DỊCH VỤ xử lý với các `API` của Cloud.
>   - `[localization]` - gói ngôn ngữ cho ứng dụng tuỳ theo vùng miền.
>   - `[utils]` - các <u>tiện ích thiết yếu</u> như:
>     - `[constants]` - các dữ liệu hằng số của ứng dụng, như: color, size, enum, text, api-constant, image-string, ...
>     - `[device]` - các chức năng cho thiết bị, như: xoay ngang dọc, keyboard, ...
>     - `[formatters]` - các định dạng, như: định dạng ngày, định dạng số điện thoại, định dạng thẻ ngân hàng, ...
>     - `[http]` - các chức năng về `HTTP`.
>     - `[local_storage]` - các chức năng *"lưu trữ cục bộ"* trên thiết bị.
>     - `[logging]` - các chức năng quản lý tài khoản người dùng.
>     - `[theme]` - các cài đặt chủ đề UI cho ứng dụng.
>     - `[validators]` - trình xác thực, như: xác thực tài khoản, xác thực Email, xác thực số điện thoại, xác thực thẻ ngân hàng, ...
>
> **[!]** Cuối cùng, thư mục `[features]` - nơi chứa các tính năng của dự án. Cụ thể dự án này có 3 tính năng chính:
> - `authentication`: tính năng xác thực người dùng.
> - `personnalization`: tính năng cho người dùng cá nhân hoá.
> - `shop`: tính năng của cửa hàng.

---
---
---

## Phần II. UI Design:

> - Login Design.
> - E-Commerce Design.
>
> ---
>
> <u>Nguồn</u>:
> - [Flaticon](https://www.flaticon.com/): Icon cho Logo Splash.
> - [Free vector and 3D illustrations](https://icons8.com/illustrations): ảnh động cho OnBoarding Screen.
> - [Freepik](https://www.freepik.com/): ảnh Banner.
>
> ---
>
> <u>Sản phẩm</u>:
> - Shoes
>   - Nike
>     - [Tatum 2 'Sidewalk Chalk' PF](https://www.nike.com/vn/t/tatum-2-sidewalk-chalk-pf-basketball-shoes-SjC3nc/FZ2203-600)
>     - [Air Jordan 1 Mid](https://www.nike.com/vn/t/air-jordan-1-mid-shoes-BpARGV/554724-092)
>     - [Nike Dunk Low Twist](https://www.nike.com/vn/t/dunk-low-twist-shoes-V6NqFG/DZ2794-001)
>     - [Nike Pegasus 41](https://www.nike.com/vn/t/pegasus-41-road-running-shoes-RZm89S/FD2722-701)
>     - [Jumpman MVP](https://www.nike.com/vn/t/jumpman-mvp-shoes-JV1HCs/DZ4475-103)
>   - Adidas
>     - [SOLEMATCH CONTROL TENNIS SHOES](https://www.adidas.com.vn/en/solematch-control-tennis-shoes/IF0438.html)
>     - [BARRICADE 13 TENNIS SHOES](https://www.adidas.com.vn/en/barricade-13-tennis-shoes/IF0467.html)
>     - [ADIZERO UBERSONIC 4.1 TENNIS SHOES](https://www.adidas.com.vn/en/adizero-ubersonic-4.1-tennis-shoes/IF0445.html)
>     - [OSADE SHOES](https://www.adidas.com.vn/en/osade-shoes/ID3096.html)
>     - [ADIZERO UBERSONIC 4 TENNIS SHOES](https://www.adidas.com.vn/en/adizero-ubersonic-4-tennis-shoes/HQ8379.html)
>   - Skechers
>     - [On-The-GO GOwalk Arch Fit - Mission II](https://www.skechersvn.vn/collections/men-sandals-slides/products/skechers-nam-xang-dan-on-the-go-gowalk-arch-fit-sandals-229064)
>     - [On-The-GO Hyper Slide - Palm Vacation](https://www.skechersvn.vn/collections/men-sandals-slides/products/skechers-nam-xang-dan-on-the-go-hyper-slide-sandals-229140)
>     - [On-The-GO Hyper Slide - Simplex](https://www.skechersvn.vn/collections/men-sandals-slides/products/skechers-nam-xang-dan-on-the-go-hyper-slide-sandals-246021)
>     - [Arch Fit Foamies - Beach Escape](https://www.skechersvn.vn/collections/men-sandals-slides/products/skechers-nam-dep-quai-ngang-arch-fit-foamies-slides-243170)
>     - [Foamies Creston Ultra](https://www.skechersvn.vn/collections/men-sandals-slides/products/skechers-nam-xang-dan-foamies-creston-ultra-sandals-243100)
>   - Puma
>     - [FUTURE 7 PRO FG/AG Men's Soccer Cleats](https://us.puma.com/us/en/pd/future-7-pro-fg-ag-mens-soccer-cleats/107707?swatch=03)
>     - [FUTURE 7 MATCH RUSH Turf Trainer Men's Soccer Cleats](https://us.puma.com/us/en/pd/future-7-match-rush-turf-trainer-mens-soccer-cleats/107843?swatch=01)
>     - [ULTRA MATCH RUSH FG/AG Men's Soccer Cleats](https://us.puma.com/us/en/pd/ultra-match-rush-fg-ag-mens-soccer-cleats/107830?swatch=01)
>     - [KING ULTIMATE RUSH FG/AG Men's Soccer Cleats](https://us.puma.com/us/en/pd/king-ultimate-rush-fg-ag-mens-soccer-cleats/107824?swatch=01)
>     - [FUTURE 7 ULTIMATE CREATIVITY FG/AG Men's Soccer Cleats](https://us.puma.com/us/en/pd/future-7-ultimate-creativity-fg-ag-mens-soccer-cleats/107836?swatch=01)
> - Toys
>   - Lego
>     - [Aston Martin Safety Car & AMR23](https://www.lego.com/en-us/product/aston-martin-safety-car-amr23-76925?icmp=HP-SHCC-Standard-SC_CC_Block_Speed_Champion_76925_HP-TH-SC-M3LE7YI5VK)
>     - [Dungeons & Dragons: Red Dragon's Tale](https://www.lego.com/en-us/product/dungeons-dragons-red-dragon-s-tale-21348)
>     - [TIE Interceptor](https://www.lego.com/en-us/product/tie-interceptor-75382)
>     - [Hogwarts™ Castle: The Great Hall](https://www.lego.com/en-us/product/hogwarts-castle-the-great-hall-76435)
>     - [NASA Artemis Space Launch System](https://www.lego.com/en-us/product/nasa-artemis-space-launch-system-10341)
>   - Schleich
>     - [Schleich Bayala 70743 - Llamacorn](https://electricgemz.co.uk/collections/schleich/products/schleich-bayala-70743-llamacorn)
>     - [Schleich Bayala 70728 Rainbow Dragon](https://electricgemz.co.uk/collections/schleich/products/schleich-bayala-70728-rainbow-dragon)
>     - [Schleich Eldrador Creatures 42554 Shadow Wolf](https://electricgemz.co.uk/collections/schleich/products/schleich-eldrador-creatures-42554-shadow-wolf)
>     - [Schleich Eldrador Creatures 70152 Shadow Dragon](https://electricgemz.co.uk/collections/schleich/products/schleich-eldrador-creatures-70152-shadow-dragon)
>     - [Schleich Eldrador Creatures 70151 - Jungle Emperor](https://electricgemz.co.uk/collections/schleich/products/schleich-eldrador-creatures-70151-jungle-emperor)
>   - Bandai
>     - [GUNDAM UNIVERSE RX-78-2 GUNDAM [MARKING PLUS VER.]](https://p-bandai.com/us/item/N2627852001001)
>     - [RE/100 1/100 GUNDAM LINDWURM](https://p-bandai.com/us/item/N2583475001005)
>     - [PG 1/60 UNICORN GUNDAM PERFECTIBILITY](https://p-bandai.com/us/item/N2570545001006)
>     - [HG 1/144 GUNDAM LFRITH PRE-PRODUCTION MODEL](https://p-bandai.com/us/item/N2703002001002)
>     - [PG 1/60 UNICORN GUNDAM 03 PHENEX (NARRATIVE Ver.)](https://p-bandai.com/us/item/N2539737001005)
>   - Kotobukiya
>     - [SNK THE KING OF FIGHTERS 2001 ÁNGEL BISHOUJO STATUE](https://www.kotobukiya.co.jp/en/product/detail/p4934054050680/)
>     - [ARTFX J Tobio Kageyama](https://www.kotobukiya.co.jp/en/product/detail/p4934054051380/)
>     - [ARTFX J Io cuddling the sword](https://www.kotobukiya.co.jp/en/product/detail/p4934054059010/)
>     - [ARTFX J Izuku Midoriya Dark Deku Ver.](https://www.kotobukiya.co.jp/en/product/detail/p4934054052981/)
>     - [ARTFX J Kyojuro Rengoku](https://www.kotobukiya.co.jp/en/product/detail/p4934054026562/)

## Phần III. Backend:

> - Login Backend.
> - E-Commerce Backend.
>
> ---
>
> <u>Nguồn</u>:
> - []().
>
> ---
>
> ...
