# netology
netology
# Домашнее задание. «Введение в виртуализацию»

# Задача 2

высоконагруженная база данных MySql, критичная к отказу - виртуализация уровня ОС; дешевле кластерировать на нескольких ВМ 

различные web-приложения - виртуализация уровня ОС; для простоты масштрабирования используя тот же Docker и Kubernetes

Windows-системы для использования бухгалтерским отделом - паравиртуализация; Дёшево и вердито, нет особой необходимости в вычислительный мощностях и требований к масштабирванию

системы, выполняющие высокопроизводительные расчёты на GPU. - физические сервера; Прямой и полный доступ к вычислительным мощностям сервера


# Задача 3

Сценарий:
100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based-инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.
Ответ:
Так как большинство систем Windows based, выберу Hyper-V, у него есть роли системы резервного копирования и в сценарии нет требвоаний к Linux системам

Сценарий:
Требуется наиболее производительное бесплатное open source-решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.
Ответ:
XEN, более надежный и производиткйный относительно других opensource решений

Сценарий:
Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows-инфраструктуры.
Ответ:
KVM, т.к. имеет больший список поддерживаемого ПО Windows

Сценарий:
Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.
Ответ:
Docker, скорость развертывания и нет необходимости дополнительной настройки

# Задача 4

Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, создавали бы вы гетерогенную среду или нет?

Недостатки: Требвования к навыкам специалистов

Да, я бы создавал гетерогенную систему, т.к. для каждых систем свои требования, под которые подходят те или иные системы виртуализации.


