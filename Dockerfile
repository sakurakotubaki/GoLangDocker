# Dockerfile
FROM golang:1.16
# WORKDIRは、コンテナ内で作業するディレクトリを指定する
WORKDIR /app
# COPYは、ローカルのファイルをコンテナの作業ディレクトリにコピーする
COPY . .
# RUN go mod init helloは、go.modファイルを作成する
RUN go mod init hello
# RUN go build -o mainは、mainという名前のバイナリをビルドする
RUN go build -o main
# EXPOSE 80は、コンテナが外部に公開するポートを指定する
EXPOSE 80
# CMD ["./main"]は、コンテナ起動時に実行するコマンドを指定する
CMD ["./main"]
