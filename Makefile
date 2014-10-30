help:
	@echo 
	@echo Quick tools for kdvr/lamp-5.4:
	@echo -e \\t make build\\t		Build docker image
	@echo -e \\t make run\\t		Run docker image name \"web54\"
	@echo -e \\t make restart\\t		Restart docker image named \"web54\"
	@echo -e \\t make stop\\t		Stop docker image named \"web54\"
	@echo -e \\t make remove\\t		Remove docker image named \"web54\"
	@echo -e \\t make void\\t		Stop and remove docker image named \"web54\"
	@echo -e \\t make reshell\\t		Runs void then relaunches shell for image named \"web54\"
	@echo -e \\t make rerun\\t		Runs void then relaunches run for image named \"web54\"
	@echo
	@exit 0;

build:
	@echo "Starting build ...."
	docker build --tag=kdvr/lamp-5.4  .
	@exit 0;

run:
	docker run --name="web54" -v ~/sites:/sites -d -p 80:80 -p 3307:3306 kdvr/lamp-5.4
	@exit 0;

shell:
	docker run --name="web54" -t -i -v ~/sites:/sites kdvr/lamp-5.4 /bin/bash
	@exit 0;

reshell: void shell
	@exit 0;

rerun: void run
	@exit 0;

stop:
	docker stop web54
	@exit 0;

remove:
	docker rm web54
	@exit 0;

void: stop remove
	@echo Web is stopped and removed
	@exit 0;

restart:
	docker restart web54
	@exit 0;