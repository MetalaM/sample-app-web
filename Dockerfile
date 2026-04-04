FROM node:14

# install sauce connect
RUN curl -LO https://saucelabs.com/downloads/sc-4.8.2-linux.tar.gz && \
    tar xvf ./sc-4.8.2-linux.tar.gz
ENV PATH="/root/sc-4.8.2-linux/bin:$PATH"

# web app
WORKDIR /sample-app-web
COPY package*.json ./
RUN npm ci
COPY . .

EXPOSE 3000
CMD ["npm", "start"]