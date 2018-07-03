# puppet
Это мое тестовое задание по работе с puppet.
 Оно включает в себя работу непосредственно с puppet, а также самую малость bash сриптинга(ну вот совсем чуть-чуть). 
 Я оставил часть задания в виде скриптов, в том виде, в котором с ним работал. Там захардкожены некоторые данные(такие, как ip, имена сертификатов и прочее), их можно было бы заменить переменными, но у меня в этом не возникло необходимости.
 
Назначение файлов и папок.

 master_install
 Это bash скрипт, устанавливающий puppet на ноду, которая будет выполнять функции сервера, и подготавливающий сервер к работе в рамках тестового задания. Для установки предусмотрена ось Ubuntu 16.04.
 Что делает скрипт:
Обновляет систему
Вносит правки в файл hosts(для проверки работы это, скорее всего, не понадобится, строки с 9 по 13 включительно можно закрыть комментариями)
Устанавливает собственно puppet из базового репозитория Ubuntu
Создает рабочие папки для тестового задания
Переносит готовые модули из репозитория в рабочие папки puppet.
Переносит файл site.pp в рабочую директорию puppet
 Отмечу, что путь к модулям по умолчанию может отличаться между заданным в скрипте и фактическим на машине, на которой скрипт может тестироваться. В этом случае понадобится либо отредактировать переменную MANDEST, либо перенести модули в актуальное для текущего сервера место вручную.

 Этот скрипт завязан на работу двух других скриптов, и в том виде, в котором представлен, не будет работать без полного соблюдения условий.
	Условия:
	Серверу редложены два сертификата, „centos“ и „ubuntu“
 Чтобы избавиться об этого условия, перед установкой посредством этого скрипта нужно закомментировать все строки 19 и ниже, включительно.

ubuntu_client_install
 Это bash скрипт для оси Ubuntu, устанавливающий puppet на ноду, которая выполняет роль тестового клиента.
 Что делает скрипт:
 Обновляет систему
Устанавливает puppet из базового репозитория Ubuntu 
Хардкодит имя сервера в /etc/hosts
Устанавливает имя сертификата ноды для работы с сервером
Запускает клиент puppet
Отправляет запрос с сертификатом на сервер.
	Примечание: скрипт master_install в предоставленном виде ожидает появления сертификата и только после его появления завершает свою работу.

centos_client_install
 Это bash скрипт для оси Centos, который аналогично скрипту  ubuntu_client_install подготавливает к работе тестовую ноду.

Папка mainfile
 Содержит файл site.pp, написанный для выполнения тестового задания. Файл переносится в /etc/puppet/manifests с заменой, поэтому, если по какой-то причине для тестирования будет использоваться «живой» сервер, рекомендуется сделать бекап рабочего файла.
 Файл содержит в себе набор инструкций для двух разных операционных систем. Нода, обращающаяся к серверу, получит набор, соответствующий ее операционной системе.
 В представленном виде сервер может работать только с осями ubuntu и centos

Папка modules
 Содержит набор простых самописных модулей puppet, предназначенных для постановки задач подчиненным нодам с осями Ubuntu и Centos.
 Модули содержат в себе следующие задачи:
Обновление системы
Установка приложений
	apache2/httpd2
	htop
	ntp
	python
	ssh
Создание папок и файлов с заданным содержимым

Синхронизация папок и файлов с заданным шаблоном

Создание пользователя, группы, включение пользователя в группу

Установку антивируса clamav и постановка задачи сканировать посредством clamscan папку /root каждый четверг в 12 часов ночи.
