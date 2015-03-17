local L = LibStub("AceLocale-3.0"):NewLocale("Skada", "ruRU", false)

if not L then return end

L["Absorb"] = "Поглощение"
L["Absorb details"] = "Детали поглот."
L["Absorbed"] = "Поглощено"
L["Absorbs"] = "Поглощения"
L["Absorbs and healing"] = "Лечение и Поглощение"
L["Absorb spells"] = "Поглощения заклинаний"
L["Active time"] = "Время активности"
L["Activity"] = "Активность" -- Needs review
L["A damage meter."] = "Измеритель урона."
L["Adds a background frame under the bars. The height of the background frame determines how many bars are shown. This will override the max number of bars setting."] = "Добавляет фон за полосами. Высота фона регулируется количеством отображаемых полос. Это аннулирует настройки максимального количества полос."
L["Aggressive combat detection"] = "Агрессивное определение режима боя"
L["All data has been reset."] = "Все данные были сброшены."
L["All Skada functionality is now in 1 addon folder."] = [=[Все возможности Skada теперь находятся в 1 папке аддона.
]=]
L["Alternate color"] = "Альтернативный цвет"
L["Announce CC breaking to party"] = "Объявлять сбитие контроля для группы"
L["Appearance"] = "Внешний вид"
-- L["Append a count to set names with duplicate mob names."] = ""
L["Ask"] = "Уточнить"
L["Attack"] = "Атака"
L["Automatically switch to set 'Current' and this mode after a wipe."] = "Автоматически переключиться в этот режим и \"Текущий бой\" после вайпа."
L["Automatically switch to set 'Current' and this mode when entering combat."] = "Автоматически переключаться на 'Текущую' установку и этот режим при входе в бой."
L["Autostop"] = "Останавливать в начале вайпа" -- Needs review
L["Autostop description"] = "Автоматически останавливать запись текущего сегмента когда половина рейда умерла." -- Needs review
L["Average hit:"] = "Среднее попадание:"
L["Background"] = "Фон"
L["Background color"] = "Цвет фона"
L["Background texture"] = "Текстура фона"
L["Bar color"] = "Цвет полос"
L["Bar display"] = "Отображение полос"
L["Bar font"] = "Шрифт на полосах"
L["Bar font size"] = "Размер шрифта на полосах"
L["Bar height"] = "Высота полос"
L["Bar orientation"] = "Ориентация полос"
L["Bars"] = "Полосы"
L["Bar spacing"] = "Промежуток между полосами"
L["Bars will grow up instead of down."] = "Полосы будут расти вверх, а не вниз."
L["Bar texture"] = "Текстура полос"
L["Bar width"] = "Длина полос"
L["Block"] = "Блок"
L["Blocked"] = "Заблокировано"
L["Border texture"] = "Текстура краёв"
L["Border thickness"] = "Толщина краёв"
L["Boss fights will be kept with this on, and non-boss fights are discarded."] = "При включении этой опции бои с боссами будут сохраняться, а бои с не-боссами будут игнорироваться."
L["Buff spell list"] = "Список баффов"
L["Buff uptimes"] = "Время действия баффов"
L["Buttons"] = "Кнопки"
L["CC"] = "СС"
L["CC breakers"] = "CC breakers"
L["CC breaks"] = "CC breaks"
L["Change"] = "Изменение"
L["Channel"] = "Канал"
L["Choose the alternate color of the bars."] = "Выберите альтернативный цвет полос."
L["Choose the background color of the bars."] = "Выберите цвет фона для строк."
L["Choose the default color of the bars."] = "Выберите цвет полос по умолчанию."
L["Choose the system to be used for displaying data in this window."] = "Выберите систему используемую для отображения данных в окне."
L["Choose the window to be deleted."] = "Выберите окно для удаления."
L["Choose which data feed to show in the DataBroker view. This requires an LDB display addon, such as Titan Panel."] = "Выберите, какие данные выводить в DataBroker. Для этого требуется, модификация которая поддерживает отображение LDB, к примеру Titan Panel."
L["Class color bars"] = "Полосы по цвету класса"
L["Class color text"] = "Текст по цвету класса"
L["Class icons"] = "Иконки класса"
L["Click below and configure your '|cFFFF0000Disabled Modules|r'."] = "Нажмите внизу и настройте свои '|cFFFF0000Отключенные модули|r'."
L["Click for"] = "Клик -"
L["Clickthrough"] = "Сквозной клик"
L["Columns"] = "Колонки"
L["Combat mode"] = "Режим битвы"
L["Combined"] = "Совместный"
L["Condensed"] = "Кратко"
L["Configure"] = "Конфигурация"
L["Configure description"] = "Позволяет настраивать активное окно Skada." -- Needs review
L["Control-Click for"] = "Control+Клик - "
L["Controls if data is reset when you enter an instance."] = "Управление сбросом данных при входе в подземелье."
L["Controls if data is reset when you join a group."] = "Управление сбросом данных при присоединении к группе."
L["Controls if data is reset when you leave a group."] = "Управление сбросом данных после выхода из группы."
L["Controls the way large numbers are displayed."] = "Выбор вида отображения цифр."
L["Controls the way set names are displayed."] = "Настройка форматирования заголовков для боя" -- Needs review
L["Create window"] = "Создать окно"
L["Critical"] = "Крит"
L["Crushing"] = "Сокр. удар"
L["Current"] = "Текущий"
L["Damage"] = "Нанесённый урон"
L["Damaged mobs"] = "Урон по врагам" -- Needs review
L["Damage done"] = "Нанесено урона"
L["Damage done per player"] = "Нанесено урона каждым игроком"
L["Damage from"] = "Урон от"
L["Damage on"] = "Урон по"
L["Damage: Personal DPS"] = "Урон: собственный УВС"
L["Damage: Raid DPS"] = "Урон: УВС рейда"
L["Damage spell details"] = "Детали боевых заклинаний"
L["Damage spell list"] = "Список заклинаний"
L["Damage taken"] = "Полученный урон"
L["DamageTaken"] = "Полученный урон"
L["Damage taken by spell"] = "Урон, полученный от заклинания"
L["Damage taken per player"] = "Получено урона каждым игроком"
L["Data Collection"] = "Сбор данных" -- Needs review
L["Data feed"] = "Подача данных"
L["Data resets"] = "Сброс данных"
L["Data segments to keep"] = "Сегменты для хранения"
L["Death log"] = "Журнал смертей"
L["Deaths"] = "Смерти"
L["Deaths:"] = "Смертей:"
L["Debuffs"] = "Отрицательные эффекты" -- Needs review
L["Debuff spell list"] = "Список отрицательных эффектов"
L["Debuff uptimes"] = "Действие дебаффа"
L["Default"] = "По умолчанию"
L["Deflect"] = "Отражение"
L["Delete segment"] = "Удалить сегмент"
L["Deletes the chosen window."] = "Удалить все выбранные окна."
L["Delete window"] = "Удалить окно"
L["Detailed"] = "Детально"
L["Disable"] = "Отключить"
L["DISABLED"] = "ВЫКЛЮЧЕН" -- Needs review
L["Disabled Modules"] = "Отключенные модули"
L["Disables mouse clicks on bars."] = "Отключить клики мышкой по полоскам."
L["Disable while hidden"] = "Отключить когда скрыт"
L["Dispels"] = "Рассеивания"
L["Dispels:"] = "Рассеивание:"
L["Display system"] = "Система отображения"
L["Distance between bars."] = "Расстояние между полосами"
L["Dodge"] = "Уклонение"
L["Do not show DPS"] = "Не показывать УВС"
L["Do not show HPS"] = "Не отображать ИВС"
L["Do not show TPS"] = "Не показывать TPS (ГУВС)"
L["Do not warn while tanking"] = "Не извещать при танковании"
L["Do you want to reset Skada?"] = "Вы действительно хотите сбросить данные?"
L["DPS"] = "УВС"
L["DTPS"] = "DTPS"
L["Enable"] = "Включить"
L["ENABLED"] = "ВКЛЮЧЕН" -- Needs review
L["Enables the title bar."] = "Включить заглавную полосу."
L["Enemies"] = "Враги"
L["Enemy damage done"] = "Нанесено урона врагом"
L["Enemy damage taken"] = "Получено урона врагом"
L["Enemy healing done"] = "Произведено исцеления врагом"
L["Enemy healing taken"] = "Получено исцеления врагом"
L["Enter the name for the new window."] = "Введите имя нового окна."
L["Enter the name for the window."] = "Введите новое имя для окна."
L["Evade"] = "Мимо"
L["Fails"] = "Неудачи"
L["Fails:"] = "Неудачи:"
L["Flash screen"] = "Мигание экрана"
L["Font flags"] = "Флаги шрифта"
L["General options"] = "Основные настройки"
L["Glancing"] = "Вскользь"
L["Guild"] = "Гильдия"
L["Healed by"] = "Healed by"
L["Healed players"] = "Исцелённые игроки"
L["Healing"] = "Исцеление"
L["Healing spell details"] = "Детали исцеляющих заклинаний"
L["Healing spell list"] = "Список исцеляющих заклинаний"
L["Healing taken"] = "Получено лечения"
L["Health"] = "Здоровье"
L["Hide in combat"] = "Скрывать в бою"
L["Hide in PvP"] = "Скрывать в PvP"
L["Hides DPS from the Damage mode."] = "Скрыть УВС в режиме урона."
L["Hides HPS from the Healing modes."] = "Скрыть ИВС (HPS) из режима исцеления."
L["Hides Skada's window when in Battlegrounds/Arenas."] = "Скрывать окно Skada на аренах/полях сражений."
L["Hides Skada's window when in combat."] = "Скрывать окно Skada в бою"
L["Hides Skada's window when not in a party or raid."] = "Скрывать окно Skada, если вы не состоите в группе или рейде."
L["Hide when solo"] = "Скрывать когда один"
L["Hide window"] = "Скрыть окно"
L["Hint: Left-Click to toggle Skada window."] = "Подсказка: [Левый клик] открывает/закрывает окно Skada."
L["Hit"] = "Попадание"
L["HPS"] = "ИВС"
L["HPS:"] = "ИВС:"
L["Ignore Main Tanks"] = "Игнорировать танков"
L["Immune"] = "Невоспр."
L["Include set"] = "Включая бой"
L["Include set name in title bar"] = "Отображать в полосе заголовка текущий бой"
L["Informative tooltips"] = "Информационная подсказка"
L["Instance"] = "Подземелье"
L["Interrupts"] = "Прерывание"
L["Keep segment"] = "Хранить сегмент"
L["Last fight"] = "Последняя битва"
L["Left to right"] = "Слева направо"
L["Lines"] = "Строки"
L["List of damaged players"] = "Список игроков, получивших урон"
L["List of damaging spells"] = "Список наносящих урон заклинаний"
L["Locks the bar window in place."] = "Зафиксировать окно"
L["Lock window"] = "Заблокировать окно"
L["Mana gained"] = "Получено маны"
L["Mana gain spell list"] = "Список способностей получения маны"
L["Margin"] = "Граница"
L["Max bars"] = "Макс полос"
L["Maximum hit:"] = "Максимальное попадание:"
L["Merge pets"] = "Объединять питомцев"
L["Merges pets with their owners. Changing this only affects new data."] = "Считать урон от атак питомцев вместе с их хозяевами. Изменение опции повлияет только на новые данные."
L["Minimum hit:"] = "Минимальное попадание:"
L["Missed"] = "Промах"
L["Mode"] = "Режим"
L["Mode description"] = "Перейти к определенному режиму" -- Needs review
L["Mode switching"] = "Смена режима"
L["Monochrome"] = "Черно-белое"
L["Name of recipient"] = "Имя получателя"
L["No"] = "Нет"
L["No mode or segment selected for report."] = "Для отчёта не выбран режим или сегмент."
L["No mode selected for report."] = "Для отчета не выбран режим."
L["None"] = "Нет" -- Needs review
L["Number format"] = "Формат чисел"
-- L["Number set duplicates"] = ""
L["Officer"] = "Офицер"
L["Only keep boss fighs"] = "Хранить только бои с боссами"
L["opens the configuration window"] = "открывает окно конфигурации"
L["Options"] = "Опции"
L["Outline"] = "Окантовка"
L["Outlined monochrome"] = "Черно-белое с окантовкой"
L["Overheal"] = "Переисцеление"
L["Overhealing"] = "Избыточное лечение"
L["Parry"] = "Парир."
L["Party"] = "Группа"
L["Percent"] = "Процент"
L["Play sound"] = "Проиграть звук"
L["Position of the tooltips."] = "Позиция подсказки"
L["Power"] = "Энергия"
L["Profiles"] = "Профили"
L["Raid"] = "Рейд"
L["RDPS"] = "РУВС"
L["RealID"] = "RealID"
L["Reflect"] = "Отражение"
L["Rename window"] = "Переименовать окно"
L["Report"] = "Отчет"
L["Report description"] = "Открыть окно для публикации ваших данных различными способами." -- Needs review
L["reports the active mode"] = "Сообщить активный режим"
L["Reset"] = "Сброс"
L["Reset description"] = "Сброс всех данных кроме тех, что помечены для сохранения." -- Needs review
L["Reset on entering instance"] = "Сбрасывать при входе в подземелье"
L["Reset on joining a group"] = "Сбрасывать при присоединении к группе"
L["Reset on leaving a group"] = "Сбрасывать при покидании группы"
L["resets all data"] = "сбрасывает все данные"
L["Resist"] = "Сопротивление"
L["Resisted"] = "Отражено"
L["Return after combat"] = "Возврат после боя"
L["Return to the previous set and mode after combat ends."] = "Возврат к предыдущей установке и режиму после окончания боя."
L["Reverse bar growth"] = "Обратный рост полос"
L["Right-click to configure"] = "ПКМ для настройки"
L["Right-click to open menu"] = "ПКМ для меню"
L["Right to left"] = "Справа налево"
L["Role icons"] = "Иконки ролей" -- Needs review
L["'s "] = " - "
L["'s Absorbs"] = " - Поглощения"
L["Say"] = "Сказать"
L["'s Buffs"] = " - баффы"
L["Scale"] = "Масштаб"
L["'s Damage"] = "- Урон"
L["'s Damage taken"] = " - Полученный урон"
L["'s Death"] = " - Смерть"
L["'s Debuffs"] = " - Отрицательные эффекты"
L["%s dies"] = "%s умирает"
L["Segment"] = "Сегмент"
L["Segment description"] = "Перейти к определенному сегменту" -- Needs review
L["Segment time"] = "Время сегментировано"
L["Self"] = "Себе"
L["Send report"] = "Отослать отчёт"
L["Set format"] = "Форматирование заголовков" -- Needs review
L["Sets the font flags."] = "Установить флаги шрифта."
L["Sets the scale of the window."] = "Установка масштаба окна"
L["'s Fails"] = " - Неудачи"
L["Shake screen"] = "Тряска экрана"
L["'s Healing"] = " - Исцеление"
L["Shift-Click for"] = "Shift+Клик -"
L["Shift + Left-Click to reset."] = "Shift + ЛКМ для сброса."
L["Show menu button"] = "Показывать кнопку меню"
L["Show minimap button"] = "Показывать кнопку у миникарты" -- Needs review
L["Show rank numbers"] = "Показать номер линии"
L["Show raw threat"] = "Show raw threat" -- Needs review
L["Shows a button for opening the menu in the window title bar."] = "Отображение кнопки для открытия меню в окне заглавия." -- Needs review
L["Shows a extra row with a summary in certain modes."] = "Отображение дополнительной строки с суммарной информацией в некоторых режимах."
L["Shows numbers for relative ranks for modes where it is applicable."] = "Показывает номера линий в режимах, где это применимо."
L["Show spark effect"] = "Показать эффект искры"
L["Shows raw threat percentage relative to tank instead of modified for range."] = "Shows raw threat percentage relative to tank instead of modified for range." -- Needs review
L["Shows subview summaries in the tooltips."] = "Настройка отображения строк информации с деталями в подсказках." -- Needs review
L["Shows threat on focus target, or focus target's target, when available."] = "Показывает угрозу цели фокуса, или цели цели фокуса, если доступно."
L["Shows tooltips with extra information in some modes."] = "В некоторых режимах показывать подсказки с дополнительной информацией."
L["Show tooltips"] = "Показывать подсказки"
L["Show totals"] = "Показывать итог"
L["Skada: Fights"] = "Skada: Бои"
L["Skada has changed!"] = "Skada изменилась!"
L["Skada Menu"] = "Меню Skada"
L["Skada: Modes"] = "Skada: Режимы"
L["Skada: %s for %s:"] = "Отчёт Skada: %s, с %s:" -- Needs review
L["Skada summary"] = "Skada: Сводка"
L["Skada usually uses a very conservative (simple) combat detection scheme that works best in raids. With this option Skada attempts to emulate other damage meters. Useful for running dungeons. Meaningless on boss encounters."] = "Обычно Skada использует простую схему определения начала боя, которая работает лучше всего в рейдах. С этой опцией Skada будет действовать как другие аддоны для подсчета урона. Полезно для подземелий. Бессмысленно на рейдовых боссах."
L["Skada will |cFFFF0000NOT|r function properly until you delete the following AddOns:"] = "Skada |cFFFF0000НЕ|r будет правильно работать, пока вы не удалите аддоны:"
L["Skada will not collect any data when automatically hidden."] = "Skada не будет собирать данные, когда скрыт."
L["Snaps the window size to best fit when resizing."] = "Размер окна автоматически подстраивается для лучшего отображения информации."
L["Snap to best fit"] = "Притягивание размера"
L["%s on %s removed by %s"] = "%s on %s removed by %s"
L["%s on %s removed by %s's %s"] = "%s on %s removed by %s's %s"
L["Spell details"] = "Детали заклинаний"
L["Spell list"] = "Список заклинаний"
L["Start new segment"] = "Начать новый сегмент"
L["Stop"] = "Остановить" -- Needs review
L["Stop description"] = "Останавливает или возобновляет запись текущего сегмента. Полезна для сокращения объема данных при вайпе. Возможна настройка автоматической остановки в настройках." -- Needs review
L["Subview rows"] = "Количество строк в подсказках" -- Needs review
L["Switch to mode"] = "Переключить режим"
L["Switch to segment"] = "Переключиться на сегмент"
L["targets"] = "цели"
L["The background color of the title."] = "Цвет фона заголовка"
L["The color of the background."] = "Цвет фона."
L["The direction the bars are drawn in."] = "Направление заполнения полос."
L["The font size of all bars."] = "Размер шрифта для всех полос."
L["The font used by all bars."] = "Шрифт всех полос."
L["The height of the bars."] = "Высота полос."
L["The height of the title frame."] = "Высота заголовка окна."
L["The height of the window. If this is 0 the height is dynamically changed according to how many bars exist."] = "Высота окна. Если значение высоты равно нулю, то она будет изменяться в соответствии с количеством существующих полос."
L["The margin between the outer edge and the background texture."] = "Разница между наружным краем и текстурой фона."
L["The maximum number of bars shown."] = "Максимальное количество отображаемых полос."
L["The number of fight segments to keep. Persistent segments are not included in this."] = "Хранимое число сегментов боёв. Длительные сегменты не входят в это."
L["The number of rows from each subview to show when using informative tooltips."] = "The number of rows from each subview to show when using informative tooltips."
L["There is nothing to report."] = "Нет данных для отчета."
L["The sound that will be played when your threat percentage reaches a certain point."] = "Будет воспроизводиться звук, когда процент угрозы достигнет определенной точки."
L["The texture used as the background."] = "Текстура фона."
L["The texture used as the background of the title."] = "Текстура, используемая для фона заглавия."
L["The texture used by all bars."] = "Текстура всех полос."
L["The texture used for the border of the title."] = "Текстура, используемая для краёв заглавия."
L["The texture used for the borders."] = "Текстура краёв."
L["The thickness of the borders."] = "Толщина краёв."
L["The width of the bars."] = "Длина всех полос."
L["Thick outline"] = "Толстая окантовка"
L["This change requires a UI reload. Are you sure?"] = "Это изменение требует перезагрузки UI. Вы уверены?"
L["This will cause the screen to flash as a threat warning."] = "Предупреждение об угрозе будет производиться посредством мигания экрана."
L["This will cause the screen to shake as a threat warning."] = "Предупреждение об угрозе будет производиться посредством тряски экрана."
L["This will play a sound as a threat warning."] = "Предупреждение об угрозе будет производиться посредством звукового сигнала."
L["Threat"] = "Угроза"
L["Threat: Personal Threat"] = "Угроза: своя угроза"
L["Threat sound"] = "Звук угрозы"
L["Threat threshold"] = "Порог угрозы"
L["Threat warning"] = "Предупреждение об угрозе"
L["Tick the modules you want to disable."] = "Выберите модули, которые хотите выключить."
L["Title bar"] = "Полоса заглавия"
L["Title height"] = "Высота заголовка"
L["Toggles showing the minimap button."] = "Отобразить/скрыть кнопку у мини-карты."
L["Toggle window"] = "Открыть/закрыть окно"
L["Tooltip position"] = "Позиция подсказки"
L["Tooltips"] = "Подсказки"
L["Top left"] = "Вверху слева"
L["Top right"] = "Вверху справа"
L["Total"] = "Всего"
L["Total healing"] = "Всего исцеления"
L["TotalHealing"] = "Общее исцеление" -- Needs review
L["TPS"] = "УгВС"
L["Use class icons where applicable."] = "Использовать иконки класса, когда это приемлимо."
L["Use focus target"] = "Исп. цель фокуса"
L["Use role icons where applicable."] = "Использовать иконки ролей (если возможно)." -- Needs review
L["When possible, bars will be colored according to player class."] = "Когда это возможно, полосы будут окрашены в соответствии с классом игрока."
L["When possible, bar text will be colored according to player class."] = "Когда это возможно, текст полос будет окрашен в соответствии с классом игрока."
L["When your threat reaches this level, relative to tank, warnings are shown."] = "При достижении угрозы до этого уровня, по сравнению с танком, будут показаны предупреждения."
L["Whisper"] = "Шепот"
L["Window"] = "Окно"
L["Window height"] = "Высота окна"
L["Windows"] = "Окна"
L["Wipe mode"] = "При вайпе"
L["Yes"] = "Да"