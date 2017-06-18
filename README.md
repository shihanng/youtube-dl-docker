Yet another attempt to create a Dockerized version of [youtube-dl](https://github.com/rg3/youtube-dl).
A cron job is setup on Travis CI to build and publish the latest version
to Docker Hub as `shihanng/youtube-dl-docker:latest`.

## Usage

Run the following:

```
docker run -it --rm -v "$(pwd):/data" shihanng/youtube-dl-docker:latest [OPTIONS] URL [URL...]
```

where `[OPTIONS] URL [URL...]` are the arguments that we will be passing to [youtube-dl](https://github.com/rg3/youtube-dl).
The resulting video files will be downloaded the current directory as specified at the above `$(pwd)`.
