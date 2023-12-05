FROM node:latest
ENV PORT=7860
ENV UUID=d342d11e-d424-4583-b36e-524ab1f0afa4
ENV PM2_HOME=/tmp

EXPOSE 7860
RUN apt-get update &&\
    apt-get install -y iproute2 vim &&\
    npm install -g pm2 &&\
    npm i -g @3kmfi6hp/nodejs-proxy

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "pm2 ls | grep -q packages || pm2 start" ]

    
CMD ["nodejs-proxy"]
USER 10014
