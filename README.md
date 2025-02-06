<!-- lib/
├── bindings/                 // Связывание модулей (DI с использованием GetX)
│   ├── app_bindings.dart     // Основной биндинг приложения, связывает основные модули.
│   ├── auth_bindings.dart    // Биндинги для авторизации.
│   ├── buyer_bindings.dart   // Биндинги для функционала покупателя.
│   ├── seller_bindings.dart  // Биндинги для функционала продавца.
│   └── admin_bindings.dart   // Биндинги для функционала администратора.
├── common/                   // Общие компоненты
│   ├── styles/               // Стили приложения
│   │   ├── colors.dart       // Основные цвета приложения.
│   │   ├── sizes.dart        // Размеры элементов интерфейса.
│   ├── themes/               // Темы приложения
│   │   ├── appbar_theme.dart         // Тема для AppBar.
│   │   ├── bottom_sheet_theme.dart   // Тема для BottomSheet.
│   │   ├── checkbox_theme.dart       // Тема для чекбоксов.
│   │   ├── chip_theme.dart           // Тема для чипов.
│   │   ├── elevated_button_theme.dart// Тема для ElevatedButton.
│   │   ├── outlined_button_theme.dart// Тема для OutlinedButton.
│   │   ├── text_field_theme.dart     // Тема для TextField.
│   │   ├── text_theme.dart           // Основная текстовая тема.
│   │   └── theme.dart                // Общие настройки темы.
│   └── widgets/              // Общие виджеты
│       ├── button.dart       // Кастомные кнопки.
│       ├── card.dart         // Карточки для отображения информации.
│       ├── loading_indicator.dart // Индикатор загрузки.
│       └── map_widget.dart   // Виджет карты.
├── data/                     // Работа с данными
│   ├── models/               // Модели данных
│   │   ├── user_model.dart   // Модель данных пользователя.
│   │   ├── cargo_model.dart  // Модель данных груза.
│   │   └── flight_model.dart // Модель данных рейсов дронов.
│   ├── repositories/         // Репозитории для работы с данными
│   │   ├── auth_repository.dart     // Репозиторий для авторизации.
│   │   ├── cargo_repository.dart    // Репозиторий для груза.
│   │   └── flight_repository.dart  // Репозиторий для рейсов дронов.
│   └── sources/              // Источники данных
│       ├── api/              // API-сервисы
│       │   ├── auth_api.dart         // API для авторизации.
│       │   ├── cargo_api.dart        // API для груза.
│       │   └── flight_api.dart       // API для рейсов дронов.
│       └── local/            // Локальное хранилище
│           ├── local_db.dart         // Локальная база данных.
│           └── cache_manager.dart    // Управление кэшированием.
├── features/                 // Функциональные модули
│   ├── auth/                 // Авторизация
│   │   ├── controllers/
│   │   │   └── auth_controller.dart  // Контроллер авторизации. 
│   │   ├── views/
│   │   │   ├── login_screen.dart     // Экран входа в систему.
│   │   │   ├── registration_screen.dart // Экран регистрации.
│   │   │   └── forgot_password_screen.dart // Экран восстановления пароля.
│   ├── buyer/                // Функционал покупателя
│   │   ├── cargo_list/       // Список грузов
│   │   │   ├── controllers/
│   │   │   │   └── cargo_list_controller.dart // Контроллер списка грузов.
│   │   │   ├── views/
│   │   │   │   └── cargo_list_screen.dart    // Экран списка грузов.
│   ├── seller/               // Функционал продавца
│   │   ├── cargo_manage/     // Управление грузами
│   │   │   ├── controllers/
│   │   │   │   └── cargo_manage_controller.dart // Контроллер управления грузами.
│   │   │   ├── views/
│   │   │   │   └── cargo_manage_screen.dart    // Экран управления грузами.
│   ├── admin/                // Функционал администратора
│   │   ├── user_manage/      // Управление пользователями
│   │   │   ├── controllers/
│   │   │   │   └── user_manage_controller.dart // Контроллер управления пользователями.
│   │   │   ├── views/
│   │   │   │   └── user_management_screen.dart // Экран управления пользователями.
│   │   ├── admin_dashboard/  // Административная панель
│   │   │   ├── controllers/
│   │   │   │   └── admin_dashboard_controller.dart // Контроллер панели администратора.
│   │   │   ├── views/
│   │   │   │   └── admin_dashboard_screen.dart    // Экран панели администратора.
│   ├── home/                 // Главный экран
│   │   ├── controllers/
│   │   │   └── home_controller.dart // Контроллер главного экрана.
│   │   ├── views/
│   │   │   ├── home_screen.dart    // Главный экран.
│   │   │   ├── dashboard_screen.dart // Дашборд.
│   │   │   └── order_status_screen.dart // Экран статуса заказа.
│   ├── profile/              // Экран профиля пользователя
│   │   ├── controllers/
│   │   │   └── profile_controller.dart // Контроллер профиля пользователя.
│   │   ├── views/
│   │   │   └── profile_screen.dart // Экран профиля пользователя.
│   ├── support/              // Поддержка
│   │   ├── controllers/
│   │   │   └── support_controller.dart // Контроллер поддержки.
│   │   ├── views/
│   │   │   └── support_screen.dart // Экран поддержки.
│   ├── orders/               // Заказы
│   │   ├── controllers/
│   │   │   └── orders_controller.dart // Контроллер заказов.
│   │   ├── views/
│   │   │   ├── order_list_screen.dart // Экран списка заказов.
│   │   │   └── order_details_screen.dart // Экран деталей заказа.
│   ├── notifications/        // Уведомления
│   │   ├── controllers/
│   │   │   └── notifications_controller.dart // Контроллер уведомлений.
│   │   ├── views/
│   │   │   └── notification_screen.dart // Экран уведомлений.
│   ├── cart/                 // Корзина
│   │   ├── controllers/
│   │   │   └── cart_controller.dart // Контроллер корзины.
│   │   ├── views/
│   │   │   └── cart_screen.dart    // Экран корзины.
│   ├── favorites/            // Избранное
│       ├── controllers/
│       │   └── favorites_controller.dart // Контроллер избранного.
│       ├── views/
│           └── favorites_screen.dart // Экран избранного.
├── localizations/            // Локализация
│   ├── en.json               // Английская локализация.
│   ├── ru.json               // Русская локализация.
│   └── localization_service.dart // Сервис локализации.
├── utils/                    // Утилиты
│   ├── constants/
│   │   ├── api_constants.dart // Константы API.
│   │   ├── app_constants.dart // Общие константы приложения.
│   │   └── strings.dart      // Строковые ресурсы.
│   ├── device/               // Утилиты устройства
│   │   ├── screen_util.dart  // Утилиты для работы с экраном.
│   │   ├── device_util.dart  // Утилиты для работы с устройством.
│   │   └── screens_utils.dart // Общие утилиты экранов.
│   ├── validators/           // Валидация данных
│   │   └── validation_util.dart // Утилита для валидации.
│   ├── helpers/              // Вспомогательные функции
│   │   ├── helper_functions.dart  // Общие вспомогательные функции.
│   │   └── date_formatter.dart    // Форматирование дат и чисел.
│   ├── http/                 // HTTP-клиенты
│   │   └── http_client.dart  // HTTP-клиент.
│   ├── local_storage/       // Локальное хранилище        
│   │   └── storage_utility.dart // Утилита локального хранилища.
│   └── logging/              // Логирование
│       └── logger.dart       // Логгер приложения.
└── app.dart                  // Основной файл приложения. -->