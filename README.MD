# Restic image with rclone

## Usage:

```bash
docker run --rm -ti \
    -v $HOME/.restic/passfile:/pass \
    -v $HOME/importantdirectory:/data \
    -v $HOME/.config/rclone/rclone.conf:/root/.config/rclone/rclone.conf \
    -e RESTIC_REPOSITORY=rclone:b2prod:yggdrasil/prod-serverA \
    michalhosna/restic-rclone:v0.1-restic0.9.4-rclone1.45 \
    -p /pass backup /data
```

## Tags

- No `latest`
- Tags are immutable, image under the tag will never change, if really necessary the tag will be deleted. (Shouldn't happen)

### Structure

```
:v0.1-restic0.9.4-rclone1.45
```

- `v0.1` - Version of this repository if anything changes in the build progress, probably won't change much
- `restic0.9.4` - Installed restic version `0.9.4`
- `rclone1.45` - Installed rclone version (without `v` prefix) `1.45`


## Info

Based upon official restic docker image, see https://github.com/restic/restic/tree/master/docker
