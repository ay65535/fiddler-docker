# 基本となるイメージを選択（この例では、Ubuntuイメージを使用）
FROM ubuntu:latest

# 依存関係のインストール
RUN apt-get update && \
    apt-get install -y wget libglib2.0-0 libnss3 libx11-xcb1 libxkbcommon0 libxcb-dri3-0 libdrm2 libgbm1 libasound2

# Fiddler Everywhereのダウンロード
RUN wget https://downloads.getfiddler.com/linux/fiddler-everywhere-4.1.2.AppImage -O /usr/local/bin/Fiddler.AppImage

# 実行権限の付与
RUN chmod +x /usr/local/bin/Fiddler.AppImage

# Fiddler Everywhereの実行
CMD ["/usr/local/bin/Fiddler.AppImage"]
