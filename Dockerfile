FROM lambci/lambda:build-nodejs12.x as build

ENV AWS_DEFAULT_REGION us-east-1

COPY . .

RUN npm install --production

FROM lambci/lambda:nodejs12.x

COPY --from=build /var/task/ /var/task/
