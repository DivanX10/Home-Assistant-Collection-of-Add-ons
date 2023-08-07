# Home Assistant Add-on: HOMEd WEB

### HOMEd WEB

![Supports amd64 Architecture][amd64-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports armv7 Architecture][armv7-shield]


[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg


<img src="https://github.com/DivanX10/Home-Assistant-Add-on-Homed/assets/64090632/bb259858-aa2e-4b79-a819-c50f830c1eea" width=10%>

* [About HOMEd](https://wiki.homed.dev/page/ZigBee)
* [HOMEd Wiki](https://wiki.homed.dev/page/HOMEd)
* [HOMEd ZigBee](https://github.com/u236/homed-service-zigbee)
* [HOMEd Web](https://github.com/u236/homed-service-web/tree/master)
* [HOMEd ZigBee: Конфигурация](https://wiki.homed.dev/page/ZigBee/Configuration)
* [HOMEd WEB: Конфигурация](https://github.com/u236/homed-service-web/blob/master/deploy/data/etc/homed/homed-web.conf)
* [HOMEd docker](https://wiki.homed.dev/page/ZigBee/Installation/Docker)

### Описание
Идея HOMEd ZigBee это попытка создать простую и понятную альтернативу популярному Z2M. По своей сути приложение является мостом между ZigBee сетью и MQTT-брокером.

С самим понятием ZigBee я столкнулся сравнительно недавно (году в 2018, примерно), очень заинтересовался и сходу начал изобретать велосипед. Текущая версия приложения третья по счету, в ней учтены все предыдущие ошибки и открытия, однако это все равно не гарантирует того, что все сделано правильно. Поэтому я всеми руками за конструктивную критику и новые идеи.

Поддерживаемые устройства
Список поддерживаемых устройств довольно скромен, однако архитектура HOMEd ZigBee позволяет довольно просто добавлять поддержку новых устройств. Сам список можно посмотреть здесь.

В версии 3.1.1 была добавлена функция распознавания для неподдерживаемых устройств. В настоящий момент эта фукция может автоматически добавить следующие типы устройств:

* Умные выключатели
* Умные розетки
* Умные лампочки
* Моторы для штор
* Датчики открытия двери/окна
* Датчики движения
* Датчики протечки
* Датчики температуры
* Датчики влажности
* Датчики освещенности
* Функция автоматического распознавания НЕ ГАРАНТИРУЕТ, что любые устройства заработают, как по волшебству. Она ориентирована, в первую очередь, на простые устройства, вроде датчиков и реле. Для полноценной и корректной поддержки, в любом случае, требуется добавление устройства в библиотеку.

### Координатор
HOMEd ZigBee поддерживает координаторы трех типов:
* На базе чипов Silicon Labs EFR32MG1/MG2 c прошивками EZSP v8/v9
* На базе чипов NXP JN5168/5169 с прошивками ZiGate
* На базе чипов Texas Instruments CC2530/2531/2538/2652 с прошивками Z-Stack, включая легаси-версии 1.2.x

### Интеграция
Начиная с версии 3.0.46 HOMEd ZigBee поддерживает функцию Home Assistant MQTT Discovery. Это значит, что при добавлении устройств в сеть они будут автоматически "проброшены" в Home Assistant, если соответствующий параметр включен в конфигурации.



