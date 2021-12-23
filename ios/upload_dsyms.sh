#  upload_dsyms.sh
#  Runner
#
#  Created by 竹尾幸紘 on 2020/09/24.
#  
#!/bin/sh

# CrashlyticsにdSYMsをアップロードする

# upload-symbolsの場所
UPLOAD_SYMBOLS="/path/to/upload-symbols"

# GoogleService-Infoファイルを指定する（ファイル名はなんでもOK。ここでは本番用に設定したファイル名にしてます）
GOOGLE_SERVICE_INFO_PLIST="/path/to/GoogleService-Info-PRD.plist"

# App Store ConnectからDownloadしたdSYMフォルダのパスを指定する。（zipファイルから解凍するとappDsymsフォルダができる）
DSYMS="/path/to/appDsyms"

"$UPLOAD_SYMBOLS" -gsp "$GOOGLE_SERVICE_INFO_PLIST" -p ios "$DSYMS"
