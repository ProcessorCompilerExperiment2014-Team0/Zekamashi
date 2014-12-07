# パイプライン処理について

* パイプラインの設計はパタヘネのものを流用する。
* 構造ハザードに対処したくないので初めのうちはHarvard Architectureにする

## ステージ
ステージの構成は以下の通り。

1. Instruction Fetch(IF)
2. Instruction Decode(ID)
3. Execution(EX)
4. Memory(MEM)
5. Write Back(WB)

## フォワーディング
3,4,5の段階のレジスタに反映されてない新しい値を2へ飛ばす

## ストール
フォワーディングで対処できないデータハザードが存在する時にパイプラインにnopをはさむ。IF/ID, ID/EXEのラッチを保存してEXEでnopを実行するようにしてやればいい

## 投機的分岐実行
分岐の実行はEXEで行うものとする。IF,IDは分岐が失敗したものとして進められるが成功した場合はIF,IDはflushされる。
