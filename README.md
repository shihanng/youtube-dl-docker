[![CircleCI](https://circleci.com/gh/shihanng/youtube-dl-docker.svg?style=svg&circle-token=b0d0047a8f3d3f737001482a8716cf36095260ff)](https://circleci.com/gh/shihanng/youtube-dl-docker)

Yet another attempt to create a Dockerized version of [youtube-dl](https://github.com/rg3/youtube-dl).

## Usage

Run the following:

```
docker run -it --rm -v "$(pwd):/data" shihanng/youtube-dl-docker:latest [OPTIONS] URL [URL...]
```

where `[OPTIONS] URL [URL...]` are the arguments that we will be passing to [youtube-dl](https://github.com/rg3/youtube-dl).
The resulting video files will be downloaded the current directory as specified at the above `$(pwd)`.
