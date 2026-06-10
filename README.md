# ITE Store

ITE Store is a Flutter mobile application developed as a final exam project. The application displays products from a remote API, allows users to search products, manage a shopping cart, and perform checkout operations.ITE Store is a Flutter mobile application developed as a final exam project. The application displays products from a remote API, allows users to search products, manage a shopping cart, and perform checkout operations.

# Features

## Home Screen

- Fetch products from API
- Display products in a grid layout
- Search products by name
- Add products to cart
- Display cart item count

## Cart Screen

- View cart items
- Increase or decrease quantity
- Remove items from cart
- Calculate total price
- Checkout functionality
- Success dialog after checkout

# Environment 

Environment                 App Name                    Features
Dev                      ITE Store Dev               Full Features
UAT                      ITE Store Test              Full Features
Demo                     ITE Store Demo              View Products Only
Production               ITE Store                   Full Features

# API Base URLs

Dev
https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/dev/

UAT
https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/uat/

Demo
https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/demo/

Production
https://smlp-pub.s3.ap-southeast-1.amazonaws.com/ite-store/prod/

# Project Structure

lib/
├── app/
├── models/
├── providers/
├── screen/
├── services/
├── widgets/
└── main.dart

# Technologies Used

- Flutter
- Dart
- HTTP Package
- ChangeNotifier
- Material Design

# Run Application

## Development

- Product list API:
products.json

flutter run --flavor dev --dart-define=ENV=dev

flutter run --flavor uat --dart-define=ENV=uat

flutter run --flavor demo --dart-define=ENV=demo

flutter run --flavor prod --dart-define=ENV=prod

# Result

<img width="342" height="802" alt="image" src="https://github.com/user-attachments/assets/22318dfc-08a6-44ac-9a40-92dee68da0ff" />

<img width="345" height="797" alt="image" src="https://github.com/user-attachments/assets/9ad5b16f-8774-4edb-9892-8487e570c248" />

<img width="345" height="797" alt="image" src="https://github.com/user-attachments/assets/957c3130-cc70-4d44-a75d-93dfe0282d03" />

<img width="342" height="800" alt="image" src="https://github.com/user-attachments/assets/4f724bc2-2af8-4be1-89d2-f3a65b0653a1" />





