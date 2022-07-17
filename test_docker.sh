DOCKER_NAME=vim:v17
CONTAINER_NAME=malashin_test

if [ $# -eq 0 ]
then
	DOCKER_NAME=$DOCKER_NAME
else
	DOCKER_NAME=$1
fi

if [ $# -gt 1 ]
then
	CONTAINER_NAME=$2
else
	CONTAINER_NAME=$CONTAINER_NAME 
fi

echo $DOCKER_NAME
echo $CONTAINER_NAME
# -v /home/roman/.local/share:/root/.local/share \
#-v /home/roman/.config:/root/.config \
docker run -it --rm --name $CONTAINER_NAME \
-v /opt/pycharm/:/pycharm/ \
-v /home:/home \
-v /media/:/media/ \
-v /home/roman/.config/JetBrains:/root/.config/JetBrains \
-v /home/roman/.local/share/JetBrains:/root/.local/share/JetBrains \
-v /home/roman/.wakatime.cfg:/root/.wakatime.cfg \
-v /home/roman/.wakatime:/root/.wakatime \
-v /home/roman/.cache:/root/.cache \
-v /usr/local/data:/usr/local/data \
-p 6006:6006 \
--gpus all \
-e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTHORITY \
-e XSOCK=/tmp/.X11-unix \
-v /run/user:/run/user \
-u 0:0 \
--net=host \
--privileged \
--shm-size=32G $DOCKER_NAME bash
