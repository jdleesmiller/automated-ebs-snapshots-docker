# `automated-ebs-snapshots` in Docker

This is a minimal Dockerfile for the [automated-ebs-snapshots](https://github.com/skymill/automated-ebs-snapshots) tool.

## Usage

The basic approach is:

```
docker run --rm automated-ebs-snapshots --help
```

For the command to be useful, you will need to pass in the region, AWS key ID and AWS secret access key. There are several equally good ways to do this: mount configuration file(s), or pass command line arguments or set environment variables.

### Configuration File

You can bind a configuration file on the host into the container and then pass it to the `--config` option.

Example with `--mount`:

```
docker run --rm \
  --mount type=bind,source=/host/path/to/automated-ebs-snapshots.conf,target=/etc/automated-ebs-snapshots.conf,readonly \
  automated-ebs-snapshots --config /etc/automated-ebs-snapshots.conf --list
```

Example with `--volume` (somewhat shorter but less explicit):

```
docker run --rm \
  --volume '/host/path/to/automated-ebs-snapshots.conf:/etc/automated-ebs-snapshots.conf:ro' \
  automated-ebs-snapshots --config /etc/automated-ebs-snapshots.conf --list
```

### Command Line Options

```
docker run --rm automated-ebs-snapshots \
  --access-key-id="AKexample" \
  --secret-access-key="ba5eba11" \
  --region="us-east-1" \
  --list
```

### Environment Variables

If you already have `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `AWS_DEFAULT_REGION` in your environment, you can just pass them through:

```
docker run --rm \
  --env AWS_ACCESS_KEY_ID \
  --env AWS_SECRET_ACCESS_KEY \
  --env AWS_DEFAULT_REGION \
  automated-ebs-snapshots --list
```

or you can set them on the docker command line:

```
docker run --rm \
  --env AWS_ACCESS_KEY_ID="AKexample" \
  --env AWS_SECRET_ACCESS_KEY="ba5eba11" \
  --env AWS_DEFAULT_REGION="us-east-1" \
  automated-ebs-snapshots --list
```
