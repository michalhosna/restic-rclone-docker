ARG RESTIC_VER

# -------------------------------------

FROM alpine:3.8 as downloader

RUN apk add --no-cache \
    curl \
    unzip 

WORKDIR /var/rclone

ARG RCLONE_VER

RUN curl https://downloads.rclone.org/v${RCLONE_VER}/rclone-v${RCLONE_VER}-linux-amd64.zip -o rclone.zip && \
    unzip rclone.zip

# -------------------------------------

FROM restic/restic:$RESTIC_VER

ARG RCLONE_VER

COPY --from=downloader /var/rclone/rclone-v${RCLONE_VER}-linux-amd64/rclone /usr/bin/rclone

RUN chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone

