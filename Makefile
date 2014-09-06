help:
	@echo 
	@echo Quick tools for kdvr/lamp-5.4-docker:
	@echo -e \\t make build\\t		Build docker image
	@echo -e \\t make run\\t		Run docker image name \"web\"
	@echo -e \\t make restart\\t		Restart docker image named \"web\"
	@echo
	@exit 0;

build:
	@echo "Starting build ...."
	docker build --tag=kdvr/lamp-5.4-docker  .
	@exit 0;

run:
	docker run --name="web" -v ~/sites:/sites -d -p 80:80 kdvr/lamp
	@exit 0;

restart:
	docker restart web
	@exit 0;