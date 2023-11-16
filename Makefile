setup:
	python3 -m venv ~/.capstone

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint

test:
	# No test

lint:
	#lint dockerfile
	./hadolint Dockerfile
	#lint python
	pylint --disable=R,C,W1203 app.py

all: install lint test
