&НаСервере
Процедура Тест1()
    Массив = Новый Массив;
    Массив.Добавить(СтрокаТаблицы);
    Массив.Добавить(СтрокаТаблицы); // ошибка

    Коллекция = Новый Структура;
    Коллекция.Вставить("Ключ1", 1);
    Коллекция.Вставить("Ключ1", 1); // ошибка

    Коллекция2  = Новый Структура;
    Коллекция2.Вставить("Ключ1", 1);
    Коллекция2.Вставить("Ключ1", 2); // ошибка - вставка разных значений для одного ключа

    Если Условие() Тогда
        Массив.Добавить(СтрокаТаблицы); // не ошибка
        Коллекция.Вставить("Ключ1", 1); // не ошибка
        Коллекция2.Вставить("Ключ1", 2); // не ошибка
    КонецЕсли;

    Если Условие() Тогда
        Коллекция.Вставить("Ключ1", 1);
        Коллекция.Вставить("Ключ1", 3); // новая ошибка, а не повторение ошибки выше
    КонецЕсли;

    Для Каждого Элемент Из Коллекция Цикл
        Итог.Коллекция.Индексы.Добавить("Пользователь");
        Итог.Коллекция.Индексы.Добавить("Пользователь"); // ошибка

        Итог.ПерваяКоллекция.Индексы.Добавить("Пользователь");
        Итог.ВтораяКоллекция.Индексы.Добавить("Пользователь"); // не ошибка
    КонецЦикла;

    Если Условие() Тогда
        ПовторнаяСоздаваемаяКоллекция = Новый Массив;
        ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь");
        ОбщаяКоллекция.Добавить(ПовторнаяСоздаваемаяКоллекция);
        ПовторнаяСоздаваемаяКоллекция = Новый Массив;
        ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь"); // не ошибка
        ОбщаяКоллекция.Добавить(ПовторнаяСоздаваемаяКоллекция); // не ошибка

        Контекст.Коллекция.Вставить("ИмяПрава", "Чтение");
        ЗаполнитьСтруктуруРасчетаПрава(Результат.СтруктураРасчетаПраваЧтение, Контекст.Коллекция);
//TODO        Контекст.Коллекция.Вставить("ИмяПрава", "Изменение"); // не ошибка или все-таки подозрительно??

        Контекст2.Коллекция.Вставить("ИмяПрава", "Чтение");
        Если Условие() Тогда
            ЕщеМетод(Контекст2);
        КонецЕсли;
//TODO        Контекст2.Коллекция.Вставить("ИмяПрава", "Изменение"); // не ошибка или все-таки подозрительно??
    КонецЕсли;

    Если Условие() Тогда

        // ошибка далее валидна и возникает из-за того, что код не режется препроцессором
        #Если ТолстыйКлиентОбычноеПриложение Тогда
            ЭлементыСтиля.Вставить(ЭлементСтиля.Ключ, ЭлементСтиля.Значение.Получить()); // ошибка
        #Иначе
            ЭлементыСтиля.Вставить(ЭлементСтиля.Ключ, ЭлементСтиля.Значение);
        #КонецЕсли
    КонецЕсли;

    Если Условие() Тогда
//TODO        Элементы.ТипСтрокой.СписокВыбора.Вставить(0, "Дата", НСтр("ru = 'Дата'")); // Вставить(0,7) - ошибка или не ошибка??
        Элементы.ТипСтрокой.СписокВыбора.Вставить(0, "Строка", НСтр("ru = 'Строка'"));
    КонецЕсли;

КонецПроцедуры

Функция ПрерываниеПотокаВыполнения(Ссылка, УчитыватьПометкуУдаления = Истина) Экспорт

	ВидыСвойствНабора = Новый Структура;
	ВидыСвойствНабора.Вставить("ДополнительныеРеквизиты", Ложь);

	ТипСсылки = Неопределено;
	МетаданныеВладельца = МетаданныеВладельцаЗначенийСвойствНабора(Ссылка, УчитыватьПометкуУдаления, ТипСсылки);

	Если МетаданныеВладельца = Неопределено Тогда
		Возврат ВидыСвойствНабора; // прерывание потока выполнения
	КонецЕсли;

	// Проверка использования дополнительных реквизитов.
	ВидыСвойствНабора.Вставить("ДополнительныеРеквизиты", Истина); // не ошибка

	Возврат ВидыСвойствНабора;

КонецФункции

Процедура ПрисваиваниеСложногоВыражения(Данные)
        Данные.ПовторнаяСоздаваемаяКоллекция = Новый Массив;
        Данные.ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь");
        Данные.ОбщаяКоллекция.Добавить(Данные.ПовторнаяСоздаваемаяКоллекция);

        Данные.ПовторнаяСоздаваемаяКоллекция = Новый Массив;
        Данные.ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь"); // не ошибка
        Данные.ОбщаяКоллекция.Добавить(Данные.ПовторнаяСоздаваемаяКоллекция); // не ошибка

        Данные.Метод().ПовторнаяСоздаваемаяКоллекция = Новый Массив;
        Данные.Метод().ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь");
        Данные.Метод().ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь"); // ошибка

        Данные.Метод().ОбщаяКоллекция.Добавить(Данные.Метод().ПовторнаяСоздаваемаяКоллекция);
        Данные.Метод().ОбщаяКоллекция.Добавить(Данные.Метод().ПовторнаяСоздаваемаяКоллекция); // ошибка

        Данные.Метод().ПовторнаяСоздаваемаяКоллекция = Новый Массив;
        Данные.Метод().ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь"); // не ошибка
        Данные.Метод().ОбщаяКоллекция.Добавить(Данные.Метод().ПовторнаяСоздаваемаяКоллекция); // не ошибка
КонецПроцедуры

Функция ВнутреннееПрерываниеПотокаВыполнения()

	ВидыСвойствНабора = Новый Структура;
    ВидыСвойствНабора.Вставить("ДополнительныеРеквизиты", Ложь);

    Для Каждого Элемент Из Коллекция Цикл
        Прервать;
    КонецЦикла;

	// Проверка использования дополнительных реквизитов.
    ВидыСвойствНабора.Вставить("ДополнительныеРеквизиты", Истина); // ошибка

	Возврат ВидыСвойствНабора;

КонецФункции

Функция ДублированиеВПоследующихЭлементах()

    ПовторнаяСоздаваемаяКоллекция = Новый Массив;
    ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь");
    ОбщаяКоллекция.Добавить(ПовторнаяСоздаваемаяКоллекция);

    ПовторнаяСоздаваемаяКоллекция = Новый Массив;
    ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь"); // не ошибка
    ПовторнаяСоздаваемаяКоллекция.Добавить("Пользователь"); // ошибка

    ОбщаяКоллекция.Добавить(ПовторнаяСоздаваемаяКоллекция); // не ошибка
    ОбщаяКоллекция.Добавить(ПовторнаяСоздаваемаяКоллекция); // ошибка

КонецФункции
