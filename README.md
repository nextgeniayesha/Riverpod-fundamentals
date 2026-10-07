# Riverpod-Fundamentals

Riverpod in Flutter, covering the main provider types, when to use each, and how to manage state effectively with simple, real-world examples.

## 📊 Slides

Session slides: https://canva.link/f3rkd8x2q1v3veg

## 📱 What's inside

The app opens on the first screen. Use the **Next** and **Previous** buttons to move through the topics in order:

| # | Screen | Topic |
|---|---|---|
| 1 | Name | `Provider` – a read-only value |
| 2 | Counter | `StateProvider` – a small value that changes, `ref.watch` vs `ref.read` |
| 3 | Profile | `copyWith`, `select` and `Consumer` (TextField + Switch) |
| 4 | Todo | `StateNotifierProvider` – a list with add / toggle / rename / remove |
| 5 | Future | `FutureProvider` – loading / error / data with `.when`, cache and `ref.invalidate` |
| 6 | Stream | `StreamProvider` – values that keep coming |
| 7 | Posts API | `FutureProvider` + `http` – a real GET request |
| 8 | Post by id | `FutureProvider.family` – a provider that takes an input |
| 9 | Fruit search | Combining providers – one provider watches two others |

## 📁 Project structure

```
lib/
├── main.dart          # ProviderScope + first screen
├── models/            # Plain Dart classes (copyWith, fromJson)
├── providers/         # All providers (with comments explaining each one)
├── screens/           # One screen per topic
└── widgets/           # Next / Previous bar
```

## ▶️ Run

```bash
flutter pub get
flutter run
```
