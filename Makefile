# Установка зависимостей
install_req:
	ansible-galaxy install -r requirements.yml

# Подключение к созданным дролетам
ssh:
	ssh root@143.198.122.152
ssh2:
	ssh root@143.198.163.2

# Локальный запуск контейнера redmine
run_local: test_base test_redmine
test_base:
	docker run --rm -d \
	--name test_base \
	-e POSTGRES_USER=redmine \
	-e POSTGRES_PASSWORD=secret \
	postgres
test_redmine:
	docker run --rm -d \
	--name test_redmine \
	-p 8080:3000 \
	-e REDMINE_DB_USERNAME=redmine \
	-e REDMINE_DB_PASSWORD=secret \
	redmine
clear_con:
	docker rm -f $$(docker ps -a -q)

# Удалённый запуск
run_remote:
	docker run -d \
	--name redmine \
	-p 80:3000 \
	-e REDMINE_DB_DATABASE=defaultdb \
	-e REDMINE_DB_POSTGRES=devops-for-programmers-project-lvl-db-do-user-9398311-0.b.db.ondigitalocean.com \
	-e REDMINE_DB_PORT=25060 \
	-e REDMINE_DB_USERNAME=doadmin \
	-e REDMINE_DB_PASSWORD=yvgkfy1as9kmz7tf \
	redmine

#Зашифровать все переменные
encrypt:
	ansible-vault encrypt group_vars/vault.yml
crypt-key:
	ansible-vault encrypt_string "value" --name 'key'
#Деплой
deploy_redmine:
	ansible-playbook playbook.yml -i inventory.ini --vault-password-file pass

