# 🍽️ Reserve Bite – Restaurant Table Reservation System

[![Flutter](https://img.shields.io/badge/Flutter-3.16-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2-0175C2?logo=dart)](https://dart.dev)
[![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?logo=supabase)](https://supabase.com)
[![GetX](https://img.shields.io/badge/GetX-4.6.6-8A2BE2)](https://pub.dev/packages/get)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📌 Overview

**Reserve Bite** is a complete restaurant reservation platform that connects **users**, **restaurant owners**, and an **admin**. Built with Flutter and Supabase, it demonstrates real‑time data sync, role‑based access, and a clean, maintainable codebase.

- **Users** can browse restaurants, book tables for specific dates/times, and manage their reservations.
- **Restaurant Owners** log in to view and respond to booking requests (accept/decline).
- **Admins** manage the restaurant listings – add new restaurants or remove existing ones.

The project follows **MVC architecture** with **GetX** for state management, routing, and dependency injection, and uses **custom reusable widgets** for a consistent UI.

---

## ✨ Features

### 👤 User
- Splash screen & role selection
- Secure email/password authentication (Supabase Auth)
- Browse all restaurants with images, cuisine, and opening hours
- View restaurant details and available time slots
- Book a table by selecting date, time, and party size
- See all personal reservations (upcoming/past) and cancel if needed

### 🍽️ Restaurant Owner
- Dedicated login for restaurant accounts
- Dashboard showing all incoming reservations in real time
- Accept or decline reservation requests (instant update for the user)
- View detailed reservation info (customer name, contact, party size)

### 🛠️ Admin
- Admin‑only login
- View all restaurants with delete option
- Add new restaurants (name, address, location, cuisine, image, opening time, closing time, etc.)

---

## 🛠️ Tech Stack

- **Frontend:** Flutter, Dart  
- **State Management:** GetX (reactive variables, route management, controllers)  
- **Backend & Auth:** Supabase (PostgreSQL, authentication)  
- **Architecture:** MVC (Model‑View‑Controller)  
- **Key Packages:** `supabase_flutter`, `get`, `intl`, `image_picker`, `lottie`, `google_fonts`, `dotted_border`, `flutter_dotenv`

---

## 📸 Screenshots

### Generic Screens
| Splash Screen | Role Selection Screen Top | Role Selection Screen Bottom |
|---------------|---------------------------|------------------------------|
| <img src="screenshots/splash_screen.png" width="200"/> | <img src="screenshots/role_screen.png" width="200"/> | <img src="screenshots/role_screen_bottom.png" width="200"/> |

### User Flow
| User Login | User Signup | User Home Screen |
|------------|-------------|------------------|
| <img src="screenshots/user/user_login_screen.png" width="200"/> | <img src="screenshots/user/user_signup_screen.png" width="200"/> | <img src="screenshots/user/user_home_screen.png" width="200"/> |

| Restaurant Detail Top | Restaurant Detail Middle | Restaurant Detail Bottom |
|----------------------|--------------------------|--------------------------|
| <img src="screenshots/user/user_reservation_detail_top_screen.png" width="200"/> | <img src="screenshots/user/user_resturant_detail_middle_screen.png" width="200"/> | <img src="screenshots/user/user_resturant_detail_bottom_screen.png" width="200"/> |

| Book Restaurant Top | Book Restaurant Bottom | User Drawer |
|--------------------|-----------------------|-------------|
| <img src="screenshots/user/user_book_table_top_screen.png" width="200"/> | <img src="screenshots/user/user_book_table_screen_bottom.png" width="200"/> | <img src="screenshots/user/user_drawer_screen.png" width="200"/> |

| Reservations Home | Reservation Detail |
|-------------------|--------------------|
| <img src="screenshots/user/user_see_reservation_screen.png" width="200"/> | <img src="screenshots/user/user_reservation_detail_screen.png" width="200"/> |

### Restaurant Owner Flow
| Owner Login | Owner Home Screen Top | Owner Home Screen Bottom |
|-------------|----------------------|--------------------------|
| <img src="screenshots/resturant/resturant_login_screen.png" width="200"/> | <img src="screenshots/resturant/resturant_home_screen_top.png" width="200"/> | <img src="screenshots/resturant/resturant_home_screen_bottom.png" width="200"/> |

| Reservation Pending | Reservation Accept | Reservation Reject |
|--------------------|--------------------|--------------------|
| <img src="screenshots/resturant/resturant_pending_reservation_screen.png" width="200"/> | <img src="screenshots/resturant/resturant_accept_reservation_screen.png" width="200"/> | <img src="screenshots/resturant/resturant_reject_reservation_screen.png" width="200"/> |

### Admin Flow
| Admin Login | Admin Home | Add Restaurant Top |
|-------------|------------|--------------------|
| <img src="screenshots/admin/admin_login_screen.png" width="200"/> | <img src="screenshots/admin/admin_home_screen.png" width="200"/> | <img src="screenshots/admin/admin_add_resturant_top_screen.png" width="200"/> |

| Add Restaurant Bottom |
|----------------------|
| <img src="screenshots/admin/admin_add_resturant_bottom_screen.png" width="200"/> |



- **Models** define the structure of data from Supabase.
- **Controllers** extend `GetxController` and manage state & logic.
- **Views** observe controllers via  `Obx`.
- **Custom widgets** ensure UI consistency and reusability.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.16)
- A Supabase account and project

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/chfaizan1537/Reserve_Bite.git
   cd Reserve_Bite

   

## 📱 Usage / App Flow

## User Role

After the splash screen, select User.

Login or register.

Browse restaurants on the home screen.

Tap a restaurant to see details and book a table.

View all your reservations in the "Reservations" section from drawer.

## Restaurant Owner Role

Select Restaurant Owner from role screen and log in with owner credentials.

See a list of all incoming reservations.

Tap a reservation to view details and accept/decline it or leave it in pending state.

The user sees the updated status in real time.

## Admin Role

Enter Credentials to login as Admin .

Manage restaurants: add new ones (with name, cuisine, address, image , etc ..).

Delete any restaurant directly from the list.

### 🔮 Future Improvements
Push notifications for reservation updates (using Supabase Edge Functions + FCM)

Table capacity management per restaurant

Ratings and reviews from users

Owner profile management (edit restaurant info)

Multi‑language support


## 📬 Contact
Created by Faizan Sarfraz  – feel free to reach out!


[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/faizan-sarfraz)

[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:faizansarfraz.info@gmail.com)

