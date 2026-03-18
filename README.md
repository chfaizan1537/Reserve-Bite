# Reserve-Bite
🍽️ Reserve Bite – A full‑stack restaurant table reservation system built with Flutter &amp; Supabase. Features three user roles (User, Restaurant Owner, Admin) with real‑time booking management. Clean MVC architecture, GetX state management, custom widgets.

# 🍽️ Reserve Bite – Restaurant Table Reservation System

[![Flutter](https://img.shields.io/badge/Flutter-3.16-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2-0175C2?logo=dart)](https://dart.dev)
[![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?logo=supabase)](https://supabase.com)
[![GetX](https://img.shields.io/badge/GetX-4.6.6-8A2BE2)](https://pub.dev/packages/get)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

###📌 Overview

**Reserve Bite** is a complete restaurant reservation platform that connects **users**, **restaurant owners**, and an **admin**. Built with Flutter and Supabase, it demonstrates real‑time data sync, role‑based access, and a clean, maintainable codebase.

- **Users** can browse restaurants, book tables for specific dates/times, and manage their reservations.
- **Restaurant Owners** log in to view and respond to booking requests (accept/decline).
- **Admins** manage the restaurant listings – add new restaurants or remove existing ones.

The project follows **MVC architecture** with **GetX** for state management, routing, and dependency injection, and uses **custom reusable widgets** for a consistent UI.

---

## ✨ Features

## 👤 User
- Splash screen & role selection
- Secure email/password authentication (Supabase Auth)
- Browse all restaurants with images, cuisine, and opening hours
- View restaurant details and available time slots
- Book a table by selecting date, time, and party size
- See all personal reservations (upcoming/past) and cancel if needed

## 🍽️ Restaurant Owner
- Dedicated login for restaurant accounts
- Dashboard showing all incoming reservations in real time
- Accept or decline reservation requests (instant update for the user)
- View detailed reservation info (customer name, contact, party size)

## 🛠️ Admin
- Admin‑only login
- View all restaurants with delete option
- Add new restaurants (name , address , location, cuisine, image , opening time , closing time .. etc.)

---

## 🛠️ Tech Stack

- **Frontend:** Flutter, Dart  
- **State Management:** GetX (reactive variables, route management, controllers)  
- **Backend & Auth:** Supabase (PostgreSQL , authentication)  
- **Architecture:** MVC (Model‑View‑Controller)  
- **Key Packages:** `supabase_flutter`, `get`, `intl`, `image_picker` , `lottie` , `google_fonts` , `dotted_border` , `flutter_dotenv`

---

## 📸 Screenshots

*Add your screenshots in a `screenshots/` folder and reference them like this:*

### User Flow
| Splash Screen | Role Selection | User Login |
|---------------|----------------|------------|
| <img src="screenshots/splash.png" width="200"/> | <img src="screenshots/role_selection.png" width="200"/> | <img src="screenshots/user_login.png" width="200"/> |

| Restaurant List | Restaurant Detail | Book Table |
|-----------------|-------------------|------------|
| <img src="screenshots/user_home.png" width="200"/> | <img src="screenshots/restaurant_detail.png" width="200"/> | <img src="screenshots/book_table.png" width="200"/> |

| Reservations Home | Reservation Detail |
|-------------------|--------------------|
| <img src="screenshots/user_reservations.png" width="200"/> | <img src="screenshots/reservation_detail.png" width="200"/> |

### Restaurant Owner Flow
| Owner Login | Reservations Dashboard | Accept/Decline |
|-------------|------------------------|----------------|
| <img src="screenshots/owner_login.png" width="200"/> | <img src="screenshots/owner_home.png" width="200"/> | <img src="screenshots/owner_reservation_detail.png" width="200"/> |

### Admin Flow
| Admin Login | Admin Home (Restaurants) | Add Restaurant |
|-------------|--------------------------|----------------|
| <img src="screenshots/admin_login.png" width="200"/> | <img src="screenshots/admin_home.png" width="200"/> | <img src="screenshots/add_restaurant.png" width="200"/> |

---

## 🏗️ Architecture & Project Structure

The codebase is organised for scalability and clarity:
