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

Сирі дані взяті з [Inside Airbnb](http://insideairbnb.com/get-the-data/) і опубліковані як **GitHub Release Assets** (бо reviews-файли перевищують 100 MB ліміт самого репозиторію):

| Файл | Розмір |
| --- | --- |
| `listings-june.csv` | ~17 MB |
| `listings-september.csv` | ~36 MB |
| `reviews-june.csv` | ~255 MB |
| `reviews-sept.csv` | ~268 MB |

Завантажити можна зі сторінки [Releases](../../releases/latest) або однією командою:

### Варіант 1. Через `curl`

```bash
BASE="https://github.com/<your-username>/<repo-name>/releases/latest/download"
for f in listings-june listings-september reviews-june reviews-sept; do
  curl -L -o "${f}.csv" "${BASE}/${f}.csv"
done
```

### Варіант 2. Прямо в R

```r
base  <- "https://github.com/<your-username>/<repo-name>/releases/latest/download"
files <- c("listings-june", "listings-september", "reviews-june", "reviews-sept")

for (f in files) {
  dest <- paste0(f, ".csv")
  if (!file.exists(dest)) {
    download.file(paste0(base, "/", dest), dest, mode = "wb")
  }
}
```

### Варіант 3. Через GitHub CLI

```bash
gh release download v1.0-data --repo <your-username>/<repo-name>
```

## Як запустити

1. Склонуйте репозиторій:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   cd <repo-name>
   ```
2. Завантажте дані одним зі способів вище.
3. Відкрийте `Project.Rproj` в RStudio.
4. Встановіть залежності:
   ```r
   install.packages(c("tidyverse", "readr", "dplyr", "stringr"))
   ```
5. Запустіть `Project_clean_data.R`. На виході отримаєте `listings.csv` для подальшої роботи в Tableau.

## Команда

Курс BUS220 — Business Intelligence and Analytics, КШЕ, 2 курс, 2 семестр.
