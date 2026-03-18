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
