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
