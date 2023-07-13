# DockerでGo言語の環境構築
Hello Worldするだけ😇

Dockerを使用してGo言語の環境を構築し、80番ポートで動作する簡単なHello Worldプログラムを作成するためには、以下の手順を行います。

まず、Goのコードを書きます。例えば、main.goという名前で以下のようなファイルを作成します：

```go
// main.go
package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "Hello, World!")
    })

    http.ListenAndServe(":80", nil)
}
```

次に、このGoのプログラムを実行するためのDockerfileを作成します：

```Docker
# Dockerfile
FROM golang:1.16

WORKDIR /app

COPY . .

RUN go mod init hello
RUN go build -o main

EXPOSE 80

CMD ["./main"]
```

## このDockerfileは、以下の手順を行います：

1. Goの公式イメージをベースに新しいDockerイメージを作成します。
2. /appディレクトリを作成し、そこを作業ディレクトリに設定します。
3. ローカルのファイルをコンテナの/appディレクトリにコピーします。
4. Goのモジュールを初期化し、ビルドを行います。
5. 80番ポートを開放します。
6. コンテナが起動したときにGoのプログラムを実行します。

以上の2つのファイル（main.goとDockerfile）を同じディレクトリに置き、そのディレクトリで以下のコマンドを実行すると、Dockerイメージがビルドされ、コンテナが起動します：
```
docker build -t my-golang-app .
docker run -p 80:80 -d my-golang-app
```

これにより、localhost:80で"Hello, World!"と表示するGoのプログラムが動作するDockerコンテナが起動します。

## 📡エンドポイントはこちら
http://localhost:80/

curlコマンドを使って、エンドポイントにアクセスしてみる
```
hashimotojunichi@hashimotojunichinoMacBook-Pro go-docker % curl http://localhost:80/
Hello, World!%
```