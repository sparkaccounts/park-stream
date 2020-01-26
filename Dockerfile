FROM jrottenberg/ffmpeg:3.4-alpine

# Run as a separate user
RUN adduser -D streamer
USER streamer

# Stream the bg.png to the channel given by the stream key. Based on https://discuss.dev.twitch.tv/t/guide-how-to-stream-a-test-image-for-extension-testing/16646
ENTRYPOINT []
CMD ffmpeg -loop 1 -framerate 15 -i https://sparkaccounts.info/stream/720p.png -f concat -safe 0 -i https://sparkaccounts.info/stream/list.txt -c:a libmp3lame -c:v libx264 -x264-params "nal-hrd=cbr" -b:a 320k -ar 44100 -b:v 1M -minrate 2M -maxrate 2M -bufsize 4M -f flv -video_size 1280x720 -pix_fmt yuv420p -r 15 -g 30 rtmp://live-dfw.twitch.tv/app/$TWITCH_STREAMKEY
