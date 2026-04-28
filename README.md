# BUS220 — Business Intelligence and Analytics: Group Project

Aналіз даних Airbnb для курсу [BUS220 (2026)](https://bus220-2026.pages.dev/project/group-project).

## Опис

Проєкт складається з двох етапів:

1. **Обробка даних в R** — очищення та підготовка датасетів listings та reviews за два періоди (червень і вересень).
2. **Візуалізація в Tableau** — побудова дашбордів на основі очищених даних.

## Структура

```
.
├── Project.Rproj            # RStudio project file
├── Project_clean_data.R     # скрипт очищення + профілювання даних
├── profile_report.md        # звіт профілювання (генерується скриптом)
├── README.md
└── .gitignore
```

Запуск `Project_clean_data.R` створює локально (не комітяться):

- `listings_clean.csv` — обʼєднані scrape-и June + September з полем `scrape_quarter`, очищеними `price`, `host_response_rate`, `host_acceptance_rate`, парсованим `bathrooms_text`, нормалізованими булевими полями, датами, та допоміжним `host_tier` (для зони Host Profiles). Це data source для Tableau.
- `reviews_clean.csv` — обʼєднані reviews з обох scrape-ів (з дедуплікацією за `id`), розпарсена `date`, додані `review_year`/`review_month`. Підключається в Tableau до Listings за `listing_id` коли потрібен volume/timing для Guest Experience.
- `profile_report.md` — числа для writeup: кількість listings/hosts, scrape overlap, NULL-rates, розподіл цін, top neighbourhoods, host tier breakdown, reviews date range. Цей файл **комітимо** в репо.

> **Примітка:** CSV-файли з даними не зберігаються в репозиторії (через ліміт GitHub 100 MB на файл). Дивіться розділ нижче, як їх отримати.


## Як запустити

1. Склонуйте репозиторій:
   ```bash
   git clone https://github.com/BAAH2n/bus220-airbnb-venice-project.git
   cd bus220-airbnb-venice-project
   ```
2. Відкрийте `Project.Rproj` в RStudio.
3. Встановіть залежності:
   ```r
   install.packages(с("tidyverse"))
   ```
4. Запустіть `Project_clean_data.R`. У папці зʼявляться `listings_clean.csv`, `reviews_clean.csv` і `profile_report.md`.


