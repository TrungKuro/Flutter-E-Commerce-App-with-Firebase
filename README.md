# e_commerce_app

> <u>Nguồn tham khảo</u>: [Professional Flutter E-Commerce App with Firebase as Backend 2024](https://www.youtube.com/playlist?list=PL5jb9EteFAOAusKTSuJ5eRl1BapQmMDT6).
>
> ---
>
> <u>3 giai đoạn chính</u>:
> 1. `Cấu hình app:`
>     - App Configuration:
>       - Setup Folder Structure.
>       - Light & Dark Theme Setup.
>       - Setup Widgets Common: button, textfield, chip, ...
>       - Create Helper Functions.
>       - Create Constants.
>       - Create Utility Classes.
> 2. `Thiết kế UI:`
>     - Login Design:
>       - Native Splash Screen.
>       - OnBoarding Screen.
>       - Register Screen (with Email Verification).
>       - Success Screen.
>       - Login Screen.
>       - Forget Screen (and Reset Password).
>     - E-Store Design:
>       - Wishlist Screen.
>       - Settings Screen.
>       - Profile Screen.
>       - Orders Screen.
> 3. `Xử lý Backend:`
>     - Login Backend:
>       - `Firebase` Setup.
>       - OnBoarding - (xuất hiện 1 lần mỗi khi chạy, lưu trữ cục bộ).
>       - Register User & Email Verification (xác thực Email và Pass, lưu trữ trong `Firestore`).
>       - Login using Email & Pass.
>       - Forget Pass & Reset Pass.
>       - `GOOGLE SIGN-IN`.
>       - `FACEBOOK SIGN-IN`.
>     - E-Store Backend:
>       - Fetch: Categories, Brands, Products.
>       - Add + Remove: Wishlist Items of each user.
>       - Add + Update + Remove: User Addresses.
>       - Add to Cart.
>       - Checkout & Create Orders.