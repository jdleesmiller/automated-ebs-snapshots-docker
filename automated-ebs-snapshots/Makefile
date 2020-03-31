install:
	python3 setup.py build
	python3 setup.py install
release:
	python3 setup.py sdist
	python3 setup.py register
	python3 -m twine upload --repository-url https://upload.pypi.org/legacy/ dist/*
