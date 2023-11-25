up:
	if [ ! -f /home/$(USER)/data ] ; then \
                mkdir -p /home/$(USER)/data/db && \
                mkdir -p /home/$(USER)/data/wp ; \
        fi
	cd srcs && docker compose up --build -d

down:
	cd srcs && docker compose -f docker-compose.yml  down
