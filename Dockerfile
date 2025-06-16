FROM node:18

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y python3 python3-pip ffmpeg
RUN pip3 install -r requirements.txt

RUN npm install
CMD ["npm", "start"]
