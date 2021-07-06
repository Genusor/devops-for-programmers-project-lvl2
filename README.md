## Hexlet tests and linter status:
[![Actions Status](https://github.com/Genusor/devops-for-programmers-project-lvl2/workflows/hexlet-check/badge.svg)](https://github.com/Genusor/devops-for-programmers-project-lvl2/actions)

### Установка зависимостей
`make install_req`

### Локальный запуск redmine
`make run_local`

### Команда для запуска в удалённой машине
```
docker run -d \
	--name redmine \
	-p 80:3000 \
	-e REDMINE_DB_DATABASE=defaultdb \
	-e REDMINE_DB_POSTGRES=devops-for-programmers-project-lvl-db-do-user-9398311-0.b.db.ondigitalocean.com \
	-e REDMINE_DB_PORT=25060 \
	-e REDMINE_DB_USERNAME=doadmin \
	-e REDMINE_DB_PASSWORD=yvgkfy1as9kmz7tf \
	redmine
```

### Деплой redmine на удалённые машины
`make deploy_redmine`

### Адрес приложения
[genusor.xyz](http://genusor.xyz/)
