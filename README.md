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
> - Gói [Read More](https://pub.dev/packages/readmore).
> - Gói [Flutter Rating Bar](https://pub.dev/packages/flutter_rating_bar).
> - ...
> - Gói [Firebase Core](https://pub.dev/packages/firebase_core).
> - Gói [Firebase Auth](https://pub.dev/packages/firebase_auth).
> - Gói [Cloud Firestore](https://pub.dev/packages/cloud_firestore).
> - Gói [Firebase Storage](https://pub.dev/packages/firebase_storage).
> - ...
> - Gói [Lottie](https://pub.dev/packages/lottie).
> - Gói [Connectivity Plus](https://pub.dev/packages/connectivity_plus).
> - Gói [Google Sign In](https://pub.dev/packages/google_sign_in).
> - ...
> - Gói [Shimmer](https://pub.dev/packages/shimmer).
> - Gói [Image Picker](https://pub.dev/packages/image_picker).
> - Gói [Cached Network Image](https://pub.dev/packages/cached_network_image).
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

## Phần II. UI Design:

> - Login Design.
> - E-Commerce Design.
>
> ---
>
> <u>Nguồn</u>:
> - [Flaticon](https://www.flaticon.com/): Icon cho Logo Splash, Icon Payment.
> - [Free vector and 3D illustrations](https://icons8.com/illustrations): ảnh động cho OnBoarding Screen.
> - [Freepik](https://www.freepik.com/): ảnh Banner, ảnh Avatar.
> - [Lottie](https://lottiefiles.com/): ảnh động cho Loading Screen.
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

## Phần III. Backend: Login Backend

> <u>Nguồn</u>:
> - [How to Setup Firebase in Flutter | Firebase CLI | Flutter Firebase](https://www.youtube.com/watch?v=91fmyvqBoEo).
> - [Use Keytool on mac for cert validation](https://dabeen.medium.com/use-keytool-on-mac-for-cert-valida-9f5572a0ebd8).
> - [Firebase products and features](https://console.firebase.google.com/project/e-commerce-a4785/features).
>
> ---
>
> `[1]` Flutter Onboarding Screen Only One Time:
> - Tailored Onboarding.
>   - Với màn hình giới thiệu [Onboarding Screen] được thiết kế để chỉ xuất hiện trong lần đầu tiên người dùng gặp ứng dụng của bạn, đủ để cung cấp cho người dùng phần giới thiệu được cá nhân hóa về ứng dụng.
>   - Và sử dụng [Firebase Authentication] để xác định xem người dùng là người mới để thêm giới thiệu [Onboarding Screen] hay người dùng cũ để đến thẳng [Login Screen] sau màn hình chờ [Splash Screen].
> - Manual Splash Screen Control.
>   - Tuỳ chỉnh cách hiển thị hoặc ẩn màn hình chờ [Splash Screen] theo cách thủ công.
> - Authentication Repository Setup.
>   - Thiết lập [Authentication Repository] đảm nhận chức năng chuyển đổi giữa các màn hình hợp lý dựa trên [User's Authentication Status] cho dù đó là lần truy cập đầu tiên hay quay lại.
> - Efficient Local Storage Mastery.
>   - Sử dụng [Local Storage] để lưu trữ và truy xuất dữ liệu, tối ưu hóa hiệu suất ứng dụng, giảm sự phụ thuộc vào các nguồn bên ngoài.
>
> <u>Debug</u>:
>
> ~~~
> - Ở lần chạy ứng dụng đầu tiên, sau khi chạy xong [Splash Screen].
>
>       flutter: === GET STORAGE Auth Repo ===
>       flutter: null
>
> - [Onboarding Screen] xuất hiện, và khi người dùng đã xem qua intro hết.
> - Sẽ hiển thị [Login Screen], bởi vì ứng dụng chưa có bất cứ thông tin của người dùng nào.
> 
>       flutter: === GET STORAGE before press [Next Button] ===
>       flutter: true
>       flutter: === GET STORAGE after press [Next Button] ===
>       flutter: false
> ~~~
>
> <u>Debug</u>:
>
> ~~~
> - Ở những lần khởi động ứng dụng sau, sau khi chạy xong [Splash Screen] sẽ vào thẳng trực tiếp [Login Screen].
> - Nếu người dùng chưa đăng nhập hoặc đã đăng xuất hoặc chưa thể đăng nhập vì chưa có đăng ký tài khoản.
>
>       flutter: === GET STORAGE Auth Repo ===
>       flutter: false
>
> - Tương tự ở những lần khởi động ứng dụng sau, sau khi chạy xong [Splash Screen] sẽ vào thẳng trực tiếp [VerifyEmail Screen].
> - Nếu người dùng đã đăng nhập nhưng tài khoản chưa được xác thực.
>
>       flutter: === GET STORAGE Auth Repo ===
>       flutter: false
>
> - Cũng tương tự ở những lần khởi động ứng dụng sau, sau khi chạy xong [Splash Screen] sẽ vào thẳng trực tiếp [Navigation Menu].
> - Nếu người dùng đã đăng nhập và tài khoản đã xác thực.
>
>       flutter: === GET STORAGE Auth Repo ===
>       flutter: false
> ~~~
>
> <u>Sơ đồ</u> cách hiển thị UI:
>
> ~~~
> [Splash Screen] --> [Onboarding Screen] --> [Login Screen]
>               | --------------------------> |
>               |
>               | --> [VerifyEmail Screen]
>               |
>               | --> [Navigation Menu]
> ~~~
>
> ---
>
> - `[2]` Flutter Firebase Email Password Authentication | Store Data In Firebase Firestore | Form Validation.
> - `[3]` Flutter Email Verification with Firebase.
> - `[4]` Login with Email and Password Firebase Flutter | Flutter Login Remember Me using Local Storage.
> - `[5]` Google Sign in Flutter Firebase | Google Authentication using Firebase:
>   - Add Dependency google_sign_in.
>     - Thêm gói pub cần thiết, **[google_sign_in]**, để kích hoạt chức năng `Google Sign-In`.
>     - [Google SignIn with Flutter | Android, iOS and Web tutorial](https://www.youtube.com/watch?v=Q00Foa8CiDk).
>     - [Google Sign in Flutter Firebase | Google Authentication using Firebase](https://www.youtube.com/watch?v=oUYiCbOETls).
>   - Enable Google Sign-In from Console.
>     - Trong dự án Firebase của bạn mà ứng dụng đang sử dụng, bật `Google Sign-In` cho ứng dụng của bạn, thiết lập liên kết xác thực an toàn.
>   - Add `SHA1` and `SHA256`.
>     - Tăng cường bảo mật cho dự án của bạn bằng cách định cấu hình cài đặt `SHA1` và `SHA256`, đảm bảo quy trình xác thực mạnh mẽ.
> - `[6]` Flutter Forgot Password with firebase | Reset Password in flutter.
> - `[7]` Flutter Firestore CRUD Operations (Create Read Update & Delete).
>   - `Create` - User Repository (User CRUD).
>   - `Fetch` - User only once and reuse throughout in the app (Reduce number of Reads).
>   - `Update` - User.
>   - `Delete` - User from Authentication and Delete Firebase Data.
> - `[8]` Flutter Upload Images To Firebase Storage | Display Images From Storage.
>   - Add Dependency image_picker.
>     - Thêm gói pub cần thiết, **[image_picker]**, để kích hoạt chức năng truy cập hình ảnh trong thiết bị người dùng làm hình nền avatar.
>     - [Image Picker Permission for Flutter iOS & Android Phone | Pick Image & Capture Image Tutorial 2023](https://www.youtube.com/watch?v=qKTUQbKZNG4).
>
> ---
>
> <u>Note</u> - các thuật ngữ:
> - `Sign-Up` ; `Log-Up` - đăng ký tài khoản.
> - `Sign-In` ; `Log-In` - đăng nhập tài khoản.
> - `Sign-Out` ; `Log-Out` - đăng xuất tài khoản.
>
> <u>Note</u> - dịch vụ Authentication của Firebase có nhiều lựa chọn (Sign-in providers) như:
> - Native providers: Email/Pass ; Phone ; Anonymous.
> - Additional providers: Google ; Facebook ; Apple ; GitHub ; ...
> - Custom providers: ...
> - Hiện tại ứng dụng đang sử dụng `4` <u>nhà cung cấp đăng nhập</u> từ Firebase là:
>   - Email/Pass.
>   - Google.
>   - Facebook.
>   - Apple.
>
> <u>Note</u> - dịch vụ Cloud Firestore của Firebase: stores data in `Documents`, which are stored in `Collections`.

### Phân tích quá trình tạo tài khoản và sử dụng ứng dụng.

> <u>Sơ đồ</u>: 
>
> ~~~
>             |<-----------|
> Đăng ký --> Xác thực --> Đăng nhập <--> Đăng xuất
> |----------------------->|
> ~~~
>
> ---
>
> Có tất cả `5` trường hợp:
> 1. Người dùng chưa có tài khoản, cần đăng ký.
>     - Đăng ký qua Email/Pass.
>     - Đăng ký qua Google.
>     - Đăng ký qua Facebook.
>     - Đăng ký qua Apple.
> 2. Người dùng đã có tài khoản, nhưng chưa xác thực.
>     - Xác thực qua Email.
> 3. Người dùng đã có tài khoản, nhưng chưa xác thực, và quên mật khẩu.
>     - Reset mật khẩu qua Email.
> 4. Người dùng đã có tài khoản, đã xác thực, chỉ cần đăng nhập.
>     - Đăng nhập qua Email/Pass.
>     - Đăng nhập qua Google.
>     - Đăng nhập qua Facebook.
> 5. Người dùng đã có tài khoản, đã xác thực, chỉ cần đăng nhập, nhưng quên mật khẩu.
>     - Reset mật khẩu qua Email.

#### Trường hợp 1: Người dùng chưa có tài khoản, cần đăng ký.

> ~~~
> [Login Screen] --- Btn.(Create Account) --> [SignUp Screen]
>              | <--------------------------- |
>
>
> [SignUp Screen] --- Btn.(Create Account)={signup} --> [VerifyEmail Screen]
>
>
> [SignUp Screen] --- Btn.(Icon Google)={googleSignIn} --> !!!
>
>
> [SignUp Screen] --- Btn.(Icon Facebook)={facebookSignIn} --> !!!
>
>
> [SignUp Screen] --- Btn.(Icon Apple)={appleSignIn} --> !!!
> ~~~
>
> - Tại màn hình **[Login Screen]** nhấn nút *(Create Account)* sẽ chuyển đến màn hình **[SignUp Screen]**.
> - Tại màn hình **[SignUp Screen]** người dùng có <u>`4` lựa chọn để đăng ký tài khoản</u>:
>
> 1. Nếu chọn đăng ký qua `Email/Pass`, nhấn nút *(Create Account)*.
>     - Tuy nhiên người dùng phải nhập đầy đủ các thông tin gồm: { First Name ; Last Name ; User Name ; E-Mail ; Phone ; Pass }.
>     - Và các thông tin này phải hợp lệ. Trong đó lưu ý { Pass } phải từ 6 kí tự trở lên, có ít nhất 1 chữ cái viết hoa, có ít nhất 1 chữ số, có ít nhất 1 kí tự đặc biệt.
>     - Bên cạnh người dùng cần đồng ý với *"chính sách bảo mật"* và *"điều khoản sử dụng"* của ứng dụng.
>     - Sau khi đăng ký người dùng mới thành công, qua dịch vụ `Authentication` của Firebase.
>     - Và ứng dụng lưu trữ thông tin người dùng mới thành công, qua dịch vụ `Cloud Firestore` của Firebase.
>     - Sau đó ứng dụng sẽ chuyển sang màn hình **[VerifyEmail Screen]**.
>
> 2. Nếu chọn đăng ký qua `Google`, nhấn nút *(Icon Google)*.
>     - !!!
>
> 3. Nếu chọn đăng ký qua `Facebook`, nhấn nút *(Icon Facebook)*.
>     - !!!
>
> 4. Nếu chọn đăng ký qua `Apple`, nhấn nút *(Icon Apple)*.
>     - !!!

#### Trường hợp 2: Người dùng đã có tài khoản, nhưng chưa xác thực.

> - Khi ứng dụng hiển thị ở màn hình **[VerifyEmail Screen]**.
> - Tức người dùng đã <u>đăng nhập thành công</u>, nhưng cần phải qua <u>thêm một bước xác thực</u> tài khoản nữa.
> - Và đồng thời ứng dụng cũng gửi `"email xác minh cho người dùng"` đến địa chỉ email đã cho.
>
> ~~~
> [VerifyEmail Screen] --- Btn.(Resend Email)={sendEmailVerification} --> [VerifyEmail Screen]
>
>
> [VerifyEmail Screen] --- Btn.(Continue)={checkEmailVerificationStatus} --> [Success Screen] --- Btn.(Continue)={screenRedirect} --> [Navigation Menu]
>                                                                        |
>                                                                        --> [VerifyEmail Screen]
>
>
> [VerifyEmail Screen] --- Btn.(Icon Clear)={logout} --> [Login Screen]
> ~~~
>
> - Lúc này người dùng check email xem nhận được tin nhắn từ ứng dụng gửi đến chưa?
> - Nếu chưa có thể nhấn nút *(Resend Email)* để thực hiện gửi lại `"email xác minh cho người dùng"` một lần nữa.
> - Nếu rồi có thể nhấn nút *(Continue)*.
>   - Nếu tài khoản <u>đã xác thực</u> thì sẽ chuyển đến màn hình **[Success Screen]** và nhấn tiếp nút *(Continue)* để đến màn hình **[Navigation Menu]**.
>   - Nếu tài khoản vẫn <u>chưa xác thực</u>, ứng dụng sẽ hiện thông báo cho biết.
> - Ngược lại, người dùng có thể nhấn nút *(Icon Clear)* sẽ <u>đăng xuất</u> tài khoản và quay lại màn hình **[Login Screen]**.

#### Trường hợp 3: Người dùng đã có tài khoản, nhưng chưa xác thực, và quên mật khẩu.

> - Tại màn hình **[Login Screen]** nhấn nút *(Forget Password)* sẽ chuyển đến màn hình **[ForgetPassword Screen]**.
> - Tại màn hình **[ForgetPassword Screen]** người dùng có thể nhấn nút *(Submit)* để yêu cầu ứng dụng gửi `"email đặt lại mật khẩu"`.
> - Tuy nhiên người dùng phải nhập đầy đủ thông tin { E-Mail } và thông tin này phải hợp lệ.
>
> ~~~
> [Login Screen] --- Btn.(Forget Password) --> [ForgetPassword Screen]
>              | <---------------------------- |
>
>
> [ForgetPassword Screen] --- Btn.(Submit)={sendPasswordResetEmail} --> [ResetPassword Screen] 
>                                                                   |
>                                                                   --> [ForgetPassword Screen]
>
>
> [ResetPassword Screen] --- Btn.(Resend Email)={resendPasswordResetEmail} --> [ResetPassword Screen]
>
>
> [ResetPassword Screen] --- Btn.(Done) --> [Login Screen]
> ~~~
>
> - Lúc này người dùng check email xem nhận được tin nhắn từ ứng dụng gửi đến chưa?
> - Nếu chưa có thể nhấn nút *(Resend Email)* để thực hiện gửi lại `"email đặt lại mật khẩu"` một lần nữa.
> - Nếu rồi có thể nhấn nút *(Done)* để quay lại màn hình **[Login Screen]**.

#### Trường hợp 4: Người dùng đã có tài khoản, đã xác thực, chỉ cần đăng nhập.

> ~~~
> [Login Screen] --- Btn.(Sign In)={emailAndPasswordSignIn} --> [VerifyEmail Screen]
>                                                           |
>                                                           --> [Navigation Menu]
>
>
> [Login Screen] --- Btn.(Icon Google)={googleSignIn} --> !!!
>
>
> [Login Screen] --- Btn.(Icon Facebook)={facebookSignIn} --> !!!
>
>
> [Login Screen] --- Btn.(Icon Apple)={appleSignIn} --> !!!
> ~~~
>
> - Tại màn hình **[Login Screen]** người dùng có <u>`4` lựa chọn để đăng nhập tài khoản</u>:
>
> 1. Nếu chọn đăng nhập qua `Email/Pass`, nhấn nút *(Sign In)*.
>     - Tuy nhiên người dùng phải nhập đầy đủ các thông tin gồm: { E-Mail ; Pass } và các thông tin này phải hợp lệ.
>     - Người dùng có thể nhấn checkbox *(Remember Me)* để ứng dụng ghi nhớ sẵn thông tin đăng nhập cho lần sau.
>     - Sau khi <u>đăng nhập thành công</u>, qua dịch vụ `Authentication` của Firebase.
>       - Nếu phát hiện tài khoản <u>chưa xác thực</u>, ứng dụng sẽ chuyển sang màn hình **[VerifyEmail Screen]**.
>       - Ngược lại, tài khoản <u>đã xác thực</u>, ứng dụng sẽ chuyển sang màn hình **[Navigation Menu]**.
>
> 2. Nếu chọn đăng nhập qua `Google`, nhấn nút *(Icon Google)*.
>     - !!!
>
> 3. Nếu chọn đăng nhập qua `Facebook`, nhấn nút *(Icon Facebook)*.
>     - !!!
>
> 4. Nếu chọn đăng nhập qua `Apple`, nhấn nút *(Icon Apple)*.
>     - !!!

#### Trường hợp 5: Người dùng đã có tài khoản, đã xác thực, chỉ cần đăng nhập, nhưng quên mật khẩu.

> Tương tự <u>trường hợp 3</u>: Người dùng đã có tài khoản, nhưng chưa xác thực, và quên mật khẩu.

### Phân tích quá trình đăng xuất hoặc xóa tài khoản.

> Gồm `2` trường hợp:
> 1. Người dùng đăng xuất, vẫn có thể đăng nhập lại.
>     - Đăng xuất tài khoản.
> 2. Người dùng xóa tài khoản, ko thể đăng nhập lại bằng tài khoản đó nữa.
>     - Xóa tài khoản đăng ký qua Email/Pass.
>     - Xóa tài khoản đăng ký qua Google.
>     - Xóa tài khoản đăng ký qua Facebook.
>     - Xóa tài khoản đăng ký qua Apple.

#### Trường hợp 1: Người dùng đăng xuất, vẫn có thể đăng nhập lại.

> ~~~
> [Settings Screen] --- Btn.(Logout)={logout} --> [SignUp Screen]
> ~~~
>
> - Tại màn hình **[Settings Screen]** thuộc mục *(Profile)* của **[Navigation Menu]**.
> - Nhấn nút *(Logout)*, sẽ đăng xuất tài khoản hiện đang đăng nhập.
> - Và chuyển đến màn hình **[SignUp Screen]**.

#### Trường hợp 2: Người dùng xóa tài khoản, ko thể đăng nhập lại bằng tài khoản đó nữa.

> ~~~
> [Settings Screen] --- Btn.(Icon Edit) --> [Profile Screen]
>                 | <---------------------- |
>
> [Profile Screen] --- Btn.(Close Account)={deleteAccountWarningPopup} --> [Dialog] --> Btn.(Cancel) --> [Profile Screen]
>                |                                                                  |
>                |                                                                  --> Btn.(Delete)={deleteUserAccount} --> [ReAuthLoginForm Screen] --- Btn.(Verify)={reAuthenticateEmailAndPasswordUser} --> [Profile Screen]
>                | <-------------------------------------------------------------------------------------------------------- |
> ~~~
>
> - Tại màn hình **[Settings Screen]** thuộc mục *(Profile)* của **[Navigation Menu]**.
> - Nhấn nút *(Icon Edit)*, sẽ chuyển đến màn hình **[Profile Screen]**.
> - Tại màn hình **[Profile Screen]** sẽ có <u>`4` trường hợp khi xóa tài khoản</u> dựa vào loại tài khoản hiện tại đang đăng nhập:
>
> 1. Xóa tài khoản đăng ký qua `Email/Pass`.
>     - Sẽ chuyển đến màn hình **[ReAuthLoginForm Screen]**, cần nhấn nút *(Verify)* để xóa tài khoản.
>     - Tuy nhiên người dùng phải nhập đầy đủ các thông tin gồm: { E-Mail ; Pass } và các thông tin này phải hợp lệ.
>     - Sau khi <u>xác thực đăng nhập lại thành công</u>, qua dịch vụ `Authentication` của Firebase.
>     - Tài khoản sẽ được xóa và chuyển đến màn hình **[Login Screen]**.
>
> 2. Xóa tài khoản đăng ký qua `Google`.
>     - !!!
>
> 3. Xóa tài khoản đăng ký qua `Facebook`.
>     - !!!
>
> 4. Xóa tài khoản đăng ký qua `Apple`.
>     - !!!

## Phần III. Backend: E-Commerce Backend

> `[9]` Flutter Fetch Categories from Firebase Only Once | Reduce Firebase Reads.
>
> !!!

---
---
---

## Cài đặt Firebase cho ứng dụng.

> Nguồn:
> - Cách cũ (thủ công) - [Flutter Firebase Setup | How to Connect Firebase with Flutter 2023](https://www.youtube.com/watch?v=keZL9K2ZmH4).
> - Cách mới (tự động) dành cho Flutter - [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=android).
> - Video - [Firebase x Flutter Masterclass](https://www.youtube.com/watch?v=0RWLaJxW7Oc).
>
> ---
>
> Cách tìm **[ Android package name ]** cho Android:
> - Nguồn: [Android Installation](https://firebase.flutter.dev/docs/manual-installation/android/).
> - Trong thư mục dự án, mở file `android/app/build.gradle` đây là tệp Gradle cấp ứng dụng (app-level).
> - Tìm đến chỉ mục `defaultConfig` bạn sẽ thấy thông tin `applicationId`.
>
> Cách tìm **[ Apple bundle ID ]** cho iOS:
> - Nguồn: [iOS Installation](https://firebase.flutter.dev/docs/manual-installation/ios/).
> - Mở `XCode`.
> - Mở file `ios/Runner.xcworkspace` trong thư mục dự án.
> - Tại thanh điều hướng bên trái, chọn `Runner` để xem toàn bộ thông tin dự án.
> - Mở tab `General` bạn sẽ thấy thông tin `Bundle Identifier` tại mục `Identity`.
>
> ---
>
> <u>Step1</u>: Cách cài đặt **[ Firebase Command Line Interface (CLI) ]**.
>
> - Yêu cầu:
>   - Trước tiên phải cài đặt **Node.js**.
>   - Bởi vì **Node.js** đi kèm với `npm`, một công cụ quản lý gói cho JavaScript.
>   - Nếu đã cài xong hoặc cài rồi có thể nhập lệnh `node -v` để kiểm tra phiên bản hiện tại.
> - Nhập lệnh: `sudo npm install -g firebase-tools` để cài đặt hoặc cập nhập.
> - Nhập lệnh: `firebase --version` để kiểm tra đã cài đặt chưa hoặc kiểm tra phiên bản hiện tại.
> - Nhập lệnh: `firebase login` để kiểm tra đã đăng nhập hay chưa? (đăng nhập với Gmail sử dụng dịch vụ Firebase).
> - Nhập lệnh: `flutter pub global activate flutterfire_cli` để cài đặt toàn cầu (global) gói `flutterfire_cli` cho **Flutter**.
> - Nhập lệnh: `export PATH="$PATH":"$HOME/.pub-cache/bin"` (nếu có theo yêu cầu từ kết quả lệnh trên) để thêm thư mục `$HOME/.pub-cache/bin` vào biến môi trường `PATH`.
>
> <u>Step2</u>: Thiết lập cấu hình cho ứng dụng của bạn để sử dụng Firebase.
>
> - Yêu cầu: tạo **[ Firebase projects ]** cho ứng dụng nếu chưa có.
> - Nhập lệnh: `flutterfire configure`, chọn *"Firebase projects"* để định cấu hình với ứng dụng **Flutter** của bạn, rồi chọn "Platforms" mà ứng dụng của bạn có hỗ trợ.
>
> <u>Step3</u>: Khởi tạo Firebase trong ứng dụng của bạn.
>
> - Nhập lệnh: `flutter pub add firebase_core` để thêm gói `firebase_core` vào dự án **Flutter** của bạn.
> - Trong tệp `lib/main.dart`, hãy khởi tạo Firebase bằng cách sử dụng đối tượng `DefaultFirebaseOptions` được xuất bởi tệp cấu hình:
>
> ```Dart
> Future<void> main() async {
>
>   WidgetsFlutterBinding.ensureInitialized();
>
>   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
>
>   runApp(const MainApp());
> }
> ```
>
> <u>Step4</u>: Thêm plugin Firebase.
>
> - Bạn truy cập Firebase trong ứng dụng **Flutter** của mình thông qua các `plugin Firebase` **Flutter** khác nhau.
> - Mỗi 1 plugin tương ứng cho 1 sản phẩm của hệ sinh thái Firebase.
> - Danh sách các `plugin Firebase` cho **Flutter** như:
>   - Authentication (`firebase_auth`).
>   - Cloud Firestore (`cloud_firestore`).
>   - Storage (`firebase_storage`).
>   - ...
> - Nhập lệnh: `flutter pub add PLUGIN_NAME` để thêm <u>plugin Firebase</u> cho dự án **Flutter** của bạn, trong đó `PLUGIN_NAME` là tên <u>plugin Firebase</u>.
> - Thông tin chi tiết các gói Pub cho `plugin Firebase` ở đây: [firebase.google.com](https://pub.dev/publishers/firebase.google.com/packages).

## Các Keyword

### Get and Add `SHA 1` and `SHA 256`

> Cho đăng ký *"dịch vụ xác thực" (Authentication)* của Firebase dành cho App Android.
>
> Trong đó, `Authentication` cung cấp giải pháp *"nhận dạng người dùng" (User Identity)* toàn diện.
>
> Firebase hỗ trợ 2 loại *"dấu vân tay chứng chỉ" (Certificate Fingerprints)*:
> - `SHA-1`: Used to create OAuth 2 client and API key for your app.
> - `SHA-256`: Used for configuring Firebase Dynamic links.
>
> `SHA certificate fingerprints:` là <u>keytool</u> để lấy *"hàm băm SHA" (SHA Hash)* của *"chứng chỉ ký" (Signing Certificate)* của bạn.
>
> <pre>
> Thiết bị phát triển Mac:
>
>   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
>
> Thiết bị phát triển Windows:
>
>   keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
>
> Thiết bị phát triển Linux:
>
>   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
> </pre>
>
> <u>Yêu cầu</u>: để sử dụng `keytool` thiết bị cần cài đặt **Java** để chạy `Java Runtime`.
> - Truy cập trang (http://www.java.com) để down Java.
> - Cài đặt và nhập lệnh `java -version` để kiểm tra đã cài đặt chưa, cũng như phiên bản hiện tại.

### Cloud Firestore & Cloud Storage

> Lưu ý có 2 chế độ:
> - `Production Mode:`
>   - Dữ liệu của bạn theo mặc định là riêng tư.
>   - Quyền truy cập đọc/ghi của khách hàng sẽ chỉ được cấp theo quy định của *"quy tắc bảo mật" (Security Rules)* của bạn.
>   - Sau khi xác định *"cấu trúc dữ liệu" (Data Structure)* của mình, bạn sẽ cần viết các quy tắc để bảo mật dữ liệu của mình.
> - `Test Mode:`
>   - Dữ liệu của bạn được mở theo mặc định để cho phép thiết lập nhanh.
>   - Tuy nhiên, bạn phải cập nhật các *"quy tắc bảo mật"* của mình trong vòng 30 ngày.
>   - Để cho phép máy khách có quyền truy cập đọc/ghi dài hạn.
>
> Trong đó:
> - `Cloud Storage` có chức năng *"lưu trữ" (Store)* và *"truy xuất" (Retrieve)* nội dung do người dùng tạo.
> - `Cloud Firestore` có chức năng cập nhập data theo <u>thời gian thực</u>, khả năng <u>truy vấn</u> mạnh mẽ và tự động <u>mở rộng</u> quy mô.

### Các lệnh [GetX]:

> |Lệnh|Chức năng|Ví dụ|
> |----|---------|-----|
> |`Get.to()`|Navigate to a new screen.|Get.to(NextScreen());|
> |`Get.off()`|To go to the next screen and no option to go back to the previous screen.|Get.off(NextScreen());|
> |`Get.offAll()`|To go to the next screen and cancel all previous routes.|Get.offAll(NextScreen());|
> |---|---|---|
> |`Get.back()`|To close snackbars, dialogs, bottomsheets, or anything you would normally close with **Navigator.pop(context);**|Get.back();|
> |---|---|---|
> |`Get.put()`|Instantiate your class using **Get.put()** to make it available for all "child" routes there.|final Controller c = Get.put(Controller());|
> |`Get.find()`|You can ask Get to find a Controller that is being used by another page and redirect you to it.|final Controller c = Get.find();|
> |---|---|---|
> |`Get.context`|Gives the current context of the Navigator.||
> |`Get.overlayContext`|Give access to current Overlay Context. Gives the context of the snackbar/dialog/bottomsheet in the "foreground", anywhere in your code.||
> |---|---|---|
> |`Get.snackbar()`|Sử dụng Widget Snackbar mà ko cần Context.||
> |`Get.defaultDialog()`|Sử dụng Widget Dialog mà ko cần Context.||

### Các lớp "Controller" trong dự án sử dụng [GetxController]:

> `Obx` có theo dõi:
> - `HomeController`
> - `NavigationController`
> - `LoginController`
> - `SignupController`
>
> ...:
> - `OnBoardingController`
> - `ForgetPasswordController`
> - `VerifyEmailController`
> - `UserController`
>
> ...:
> - `AuthenticationRepository`
> - `UserRepository`
>
> ...:
> - `NetworkManager`

### Các lệnh [Navigator]:

> - `Navigator.of().pop()`
> - `Navigator.push()`

### Các lệnh [MediaQuery]:

> - `MediaQuery.of()`

### Các lệnh [Theme]:

> - `Theme.of()`

### Các hàm xử lý thao tác nhấn của người dùng:

> |Param|Type|
> |-----|----|
> |`onTap`|void Function()? = VoidCallback?|
> |`onPressed`|void Function()? = VoidCallback?|
> |---|---|
> |`leadingOnPressed`|void Function()? = VoidCallback?|
> |`onActionPressed`|void Function()? = VoidCallback?|
> |---|---|
> |`onDotClicked`|void Function(int)?|
> |`onPageChanged`|void Function(int)?|
> |`onDestinationSelected`|void Function(int)?|
> |---|---|
> |`onChanged`|void Function(bool?)?|
> |---|---|
> |`validator`|String? Function(String?)?|
>
> <u>Note</u>:
>
> ``` Dart
> typedef VoidCallback = void Function()
> ```

### Các Widget nút nhấn:

> - `TextButton`
> - `IconButton`
> - `ElevatedButton`
> - `OutlinedButton`
> - `DropdownButtonFormField`

## Các vấn đề

> ...