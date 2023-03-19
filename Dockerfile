# 基本となるイメージを選択（この例では、Ubuntuイメージを使用）
# docker run -it --rm --privileged ubuntu:22.04
FROM ubuntu:22.04

# 依存関係のインストール
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y wget libglib2.0-0 libnss3 libx11-xcb1 libxkbcommon0 libxcb-dri3-0 libdrm2 libgbm1 libasound2 kmod libfuse2 libxshmfence1 libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0

# Fiddler Everywhereのダウンロード
RUN wget https://downloads.getfiddler.com/linux/fiddler-everywhere-4.1.2.AppImage -O /usr/local/bin/Fiddler.AppImage

# FiddlerScriptファイルをコンテナにコピー
COPY fiddler_autoresponder.fsl /fiddler_autoresponder.fsl

# 実行権限の付与
RUN chmod +x /usr/local/bin/Fiddler.AppImage

# 環境変数を設定
ENV FIDDLER_SCRIPT_PATH /fiddler_autoresponder.fsl

# Fiddler Everywhereの実行
CMD ["/usr/local/bin/Fiddler.AppImage", "--no-sandbox"]
