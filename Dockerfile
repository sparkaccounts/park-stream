FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -re -loop 1 -framerate 1 -i https://sparkaccounts.info/stream/720p.png -f concat -safe 0 -i https://sparkaccounts.info/stream/list.txt -f flv -video_size 1280x720 -vcodec libx264 -pix_fmt yuv420p -preset fast -r 1 -g 2 rtmp://live-fra.twitch.tv/app/$TWITCH_STREAMKEY
