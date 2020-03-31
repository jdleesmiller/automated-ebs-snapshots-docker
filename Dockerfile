FROM python:3

RUN echo "Force rebuild"

COPY automated-ebs-snapshots automated-ebs-snapshots

WORKDIR automated-ebs-snapshots

RUN python3 setup.py build
RUN python3 setup.py sdist bdist_wheel
RUN pip3 install dist/*.whl


# The command seems to be OK with running as an unprivileged user.
USER nobody

ENTRYPOINT ["/usr/local/bin/automated-ebs-snapshots"]
