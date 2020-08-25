FROM golang as builder
COPY . .
RUN mkdir /out
RUN mkdir /out/keystore
RUN go get github.com/IvanMenshykov/MoonPhase
RUN GOOS=linux GOARCH=amd64 go build -o /out/moon

FROM ubuntu
LABEL maintainer="xanderstrike@gmail.com"
WORKDIR /app
COPY --from=builder /out .
COPY scripts/check /opt/resource/check
COPY scripts/in /opt/resource/in
COPY scripts/out /opt/resource/out
RUN chmod +x /opt/resource/check /opt/resource/in /opt/resource/in

