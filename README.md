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
├── Project_clean_data.R     # скрипт очищення даних
├── README.md
└── .gitignore
```

> **Примітка:** CSV-файли з даними не зберігаються в репозиторії (через ліміт GitHub 100 MB на файл). Дивіться розділ нижче, як їх отримати.

## Дані

Сирі дані взяті з [Inside Airbnb](http://insideairbnb.com/get-the-data/). Для відтворення потрібні файли:

| Файл | Розмір |
| --- | --- |
| `listings-june.csv` | ~18 MB |
| `listings-september.csv` | ~38 MB |
| `reviews-june.csv` | ~268 MB |
| `reviews-sept.csv` | ~282 MB |

Покладіть їх у корінь проєкту (поряд з `Project.Rproj`).

## Як запустити

1. Склонуйте репозиторій:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>
   ```
2. Завантажте CSV-файли з Inside Airbnb і покладіть у корінь проєкту.
3. Відкрийте `Project.Rproj` в RStudio.
4. Встановіть залежності:
   ```r
   install.packages(c("tidyverse", "readr", "dplyr", "stringr"))
   ```
5. Запустіть `Project_clean_data.R`. На виході отримаєте `listings.csv` для подальшої роботи в Tableau.

## Команда

Курс BUS220 — Business Intelligence and Analytics, КШЕ, 2 курс, 2 семестр.
