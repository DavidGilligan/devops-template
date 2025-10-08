.PHONY: up down logs ps verify build test fmt backup restore

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f --tail=200

ps:
	docker compose ps

verify:
	bash scripts/verify.sh

build:
	docker build -t example-app:local ./app

test:
	cd app && python -m pip install -r requirements.txt && pip install pytest && pytest -q

backup:
	bash scripts/backup.sh

restore:
	# Pass the backup ID (timestamped name) when restoring, e.g.:
	# make restore BK=ch-backup-20251004-103000
	bash scripts/restore.sh $(BK)
