### Попробуйте запустить playbook на окружении из test.yml, зафиксируйте значение, которое имеет факт some_fact для указанного хоста при выполнении playbook.

![alt text](task1_1.png)

### Воспользуйтесь подготовленным (используется docker) или создайте собственное окружение для проведения дальнейших испытаний.

![alt text](task1_2.png)

### Проведите запуск playbook на окружении из prod.yml. Зафиксируйте полученные значения some_fact для каждого из managed host.

![alt text](task1_3.png)

### Добавьте факты в group_vars каждой из групп хостов так, чтобы для some_fact получились значения: для deb — deb default fact, для el — el default fact.

![alt text](task1_4.png)

### При помощи ansible-vault зашифруйте факты в group_vars/deb и group_vars/el с паролем netology.

![alt text](task1_5.png)
![alt text](task1_6.png)

### Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь в работоспособности.

![alt text](task1_7.png)


### Посмотрите при помощи ansible-doc список плагинов для подключения. Выберите подходящий для работы на control node.
### В prod.yml добавьте новую группу хостов с именем local, в ней разместите localhost с необходимым типом подключения.
### Запустите playbook на окружении prod.yml. При запуске ansible должен запросить у вас пароль. Убедитесь, что факты some_fact для каждого из хостов определены из верных group_vars.

![alt text](task1_8.png)