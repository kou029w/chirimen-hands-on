---
title: Raspberry Pi Zero 版 CHIRIMEN
marp: true
paginate: true
style: |
  section :is(h1, h2, h3, h4, h5, h6) {
    border-bottom: 10px solid #F5CE52;
  }
---

# 2024-08-10 ハンズオン

---

![bg](https://webiotmakers.github.io/static/images/2022/template/ogp.jpg)

---

# Raspberry Pi Zero 版 CHIRIMEN ハンズオン

WebDINO Japan シニアエンジニア
[渡邉浩平](https://github.com/kou029w)
![w:200](https://github.com/kou029w.png)

---

## CHIRIMEN とは

![h:480](https://res.cloudinary.com/chirimen/image/fetch/c_limit,f_auto,q_auto,w_1200/https://tutorial.chirimen.org/raspi/imgs/section0/CHIRIMENforRaspberryPi3.png)

JavaScript からハードウェアを制御するプロトタイピング環境
センサーやモーターなど組み合わせたさまざまなものをつくることができます

<!-- NOTE: 10-20年前は難しいプログラミングが必要でしたが、今はJavaScriptから簡単に作れるようになりました。 -->
<!-- NOTE: 具体的にはWeb GPIO APIやWeb I2C APIと呼ばれるオープンな仕様に支えられているオープンソースソフトウェアです。 -->

---

![h:600](./assets/webiotmakers-gallery.dio.png)

<!-- NOTE: CHIRIMENを使い、アイディアを凝らしてさまざまな作品を作っています。 -->

<!-- _footer: 画像の引用元: Web×IoT メイカーズチャレンジ 作品ギャラリー https://webiotmakers.github.io/gallery/ -->

---

## 本日の内容

Raspberry Pi Zero 版 CHIRIMEN 導入編

- 11:00 L チカしてみよう
- 12:00 〜昼休み〜
- 13:00 CHIRIMEN チュートリアル
  - GPIO に関する基礎知識
  - I2C に関する基礎知識
  - 遠隔制御してみよう
  - 常駐プログラム化してみよう
- 16:00 片付け・解散

---

## 本日のゴール

センサーやモーターの基本的な使い方を理解する

---

## Slack にアクセス (まだの方)

Web IoT Makers Challenge Slack: https://webiotmakerschallenge.slack.com

---

## CHIRIMEN チュートリアル資料

https://tutorial.chirimen.org/pizero/ にアクセス

または

「chirimen pi zero」で検索 [🔍](https://www.google.com/search?q=chirimen+pi+zero)

---

## 困ったとき・分からないとき・気になることがあるとき

会場のスタッフにお気軽にお声がけください 🖐
Slack でも OK 👌

Web IoT Makers Challenge Slack: https://webiotmakerschallenge.slack.com

---

## 機材の確認

- Raspberry Pi Zero W
- CHIRIMEN スターターキット
  - microSD カード
- USB ケーブル

<!-- _footer: https://tutorial.chirimen.org/pizero/#pcwifi -->

---

## Raspberry Pi Zero の起動

![h:360](https://chirimen.org/PiZeroWebSerialConsole/imgs/PiZeroW_OTG.JPG)

1. microSD カードを差し込む
2. パソコンと USB ケーブルで接続する
3. ターミナルに接続する

<!-- _footer: https://tutorial.chirimen.org/pizero/#a-hrefhttpschirimenorgpizerowebserialconsolepizerowebserialconsolehtmla- -->

---

## ターミナルに接続

https://chirimen.org/PiZeroWebSerialConsole/PiZeroWebSerialConsole.html

1. ターミナルにアクセス
2. [Connect and Login PiZero] を選択
3. [接続]

![](https://d33wubrfki0l68.cloudfront.net/2521683e759f053b3a77eb7d91f3849f0711267b/84e41/pizero/imgs/serialdialog.png)

---

## Wi-Fi の設定

1. [wifi panel] > [SSID] [PASS PHRASE] を入力
2. [SET WiFi] を選択
3. [Reboot] を選択
4. (もう一度) ターミナルにアクセス
5. [Connect and Login PiZero] を選択
   - シリアルポートが表示されていれば OK ✅
   - 起動完了まで約 2 分間かかります
6. [接続]

<!-- _footer: https://tutorial.chirimen.org/pizero/#wifi -->

---

## ブレッドボードでの配線

![h:600](./assets/led-blink.dio.png)

<!-- _footer: https://tutorial.chirimen.org/pizero/#section-3 -->

---

## プログラムを書く

[myApp] > [移動] > [Create New Text] > "hello.js" と入力

```js
import { requestGPIOAccess } from "node-web-gpio"; // WebGPIO を使えるようにするためのライブラリをインポート
const sleep = (msec) => new Promise((resolve) => setTimeout(resolve, msec)); // sleep 関数を定義

async function blink() {
  const gpioAccess = await requestGPIOAccess(); // GPIO を操作する
  const port = gpioAccess.ports.get(26); // 26 番ポートを操作する

  await port.export("out"); // ポートを出力モードに設定

  // 無限ループ
  for (;;) {
    // 1秒間隔で LED が点滅します
    await port.write(1); // LEDを点灯
    await sleep(1000); // 1000 ms (1秒) 待機
    await port.write(0); // LEDを消灯
    await sleep(1000); // 1000 ms (1秒) 待機
  }
}

blink();
```

コピー&ペースト > [Save] (保存)

---

## プログラムの実行

"hello.js" を実行する方法

```
node hello.js
```

停止するには `Ctrl`+`C`

書式:

```
node [ファイル名]
```

---

## サンプルコードのダウンロード

CHIRIMEN panel > Get Examples > hello-real-world (L チカ) > JS GET

他のサンプルコードや配線図を参照することができます

---

## ここまでのまとめ

- Raspberry Pi Zero W のセットアップ
- LED を制御するプログラム (通称 LED チカチカ、L チカ) の実行

---

## CHIRIMEN チュートリアル資料

https://tutorial.chirimen.org/pizero/ にアクセス

または

「chirimen pi zero」で検索 [🔍](https://www.google.com/search?q=chirimen+pi+zero)

---

# 2024-08-11

---

## いろいろなデバイスを自由に試してみよう

- 自由に進めてもらって OK 👌
- 席はどこでも OK 👌 (午前中)

---

## 本日の流れ

Raspberry Pi Zero 版 CHIRIMEN 応用編

- 10:00 自由時間
- 11:00 片付け・ハッカソンチーム分け発表

アイディアワークショップ

- 13:00 ハッカソンに向けてのインプットトーク
- 13:30 アイディアワークショップ
- 14:30 ハッカソンに向けてのチーム相談タイム
- 16:20 各チームの進捗発表
- 16:40 ハッカソンについての説明、機材貸し出し、記念撮影
- 17:00 解散

---

## ハッカソンのポイント

- ときめくような素敵なアイディア
- 本番で作品が機能すること

<!-- NOTE: 昨日・今日と技術的な話を中心にやってきましたが、極端な話ハッカソンの本番は、技術的に優れているかどうかは一旦忘れてもらってOK、コピペでOK、人の真似でOK
ですが限られた時間しかないので、これからの時間で、やりたいことを周りのスタッフに相談したり、Slackで相談してみてください
 -->

![bg w:800 right:48%](./assets/webiotmakers-gallery.dio.png)

<!-- _footer: 画像の引用元: Web×IoT メイカーズチャレンジ 作品ギャラリー https://webiotmakers.github.io/gallery/ -->

---

## 【参考】過去の作品ギャラリー

「Web×IoT メイカーズチャレンジ」で検索 > ハッカソン作品集
または
https://webiotmakers.github.io/gallery/

---

## 【参考】CHIRIMEN 対応デバイスの一覧

https://tutorial.chirimen.org/partslist

こちらに掲載がないデバイスについても「〇〇をやりたい」「〇〇できるか気になる」などあればご相談ください

---

## 【参考】JavaScript Primer の紹介

> これから JavaScript を学びたい人が、ECMAScript 2015 以降をベースにして一から JavaScript を学べる書籍です。
> プログラミングをやったことがあるが、今の JavaScript がよくわからないという人が、 今の JavaScript アプリケーションを読み書きできるように書かれています。

[JavaScript Primer - 迷わないための入門書 #jsprimer](https://jsprimer.net/)

---

## 複数のデバイスを扱うヒント

- GPIO と I2C を組み合わせる
- I2C で複数のデバイスを扱う

---

## GPIO と I2C を組み合わせる

---

一定温度を超えたとき LED を点灯する例

```js
import { requestGPIOAccess } from "node-web-gpio";
import { requestI2CAccess } from "node-web-i2c";
import SHT30 from "@chirimen/sht30"; // 温湿度センサー SHT30

const gpioAccess = await requestGPIOAccess();
const gpioPort = gpioAccess.ports.get(26);
await gpioPort.export("out");

const i2cAccess = await requestI2CAccess();
const i2cPort = i2cAccess.ports.get(1);
const sht30 = new SHT30(i2cPort, 0x44);
await sht30.init();

while (true) {
  const { temperature } = await sht30.readData();
  console.log(`${temperature.toFixed(2)} ℃`);

  if (temperature > 30) {
    await gpioPort.write(1);
  } else {
    await gpioPort.write(0);
  }
}
```

<!-- _footer: 配線図省略 - コードをもとに想像して試してみよう！ -->

---

## I2C で複数のデバイスを扱う

それぞれのデバイスの VCC/GND/SDA/SCL を並列接続
![h:450](https://res.cloudinary.com/chirimen/image/fetch/c_limit,f_auto,q_auto,w_1000/https://tutorial.chirimen.org/raspi/imgs/section3/bh1750-and-adt7410.jpg)
※ 画像にある I2C デバイスはあくまで例です
スレーブアドレスが同じデバイスは同時に接続できません

---

一定温度を超えたとき NeoPixel LED を点灯する例

```js
import { requestI2CAccess } from "node-web-i2c";
import SHT30 from "@chirimen/sht30"; // 温湿度センサー SHT30
import NPIX from "@chirimen/neopixel-i2c"; // NeoPixel I2C

const i2cAccess = await requestI2CAccess();
const port = i2cAccess.ports.get(1);
const sht30 = new SHT30(port, 0x44);
await sht30.init();
const npix = new NPIX(port, 0x41);
await npix.init(8);

while (true) {
  const { temperature } = await sht30.readData();
  console.log(`${temperature.toFixed(2)} ℃`);

  if (temperature > 30) {
    await npix.setGlobal(20, 20, 0);
  } else {
    await npix.setGlobal(0, 0, 0);
  }
}
```

<!-- _footer: 配線図省略 - コードをもとに想像して試してみよう！ -->

<!-- ---

## I2C で複数のデバイスを扱う - 距離センサーと NeoPixel の例

指定の距離を下回ると NeoPixel LED を点灯する例:

```js
import { requestI2CAccess } from "node-web-i2c";
import VL53L0X from "@chirimen/vl53l0x";
import NPIX from "@chirimen/neopixel-i2c";

const i2cAccess = await requestI2CAccess();
const port = i2cAccess.ports.get(1);

const vl53l0x = new VL53L0X(port, 0x29);
await vl53l0x.init();

const npix = new NPIX(port, 0x41);
await npix.init(8);

while (true) {
  const distance = await vl53l0x.getRange();
  console.log(`${distance} mm`);

  if (distance < 100) {
    await npix.setGlobal(100, 100, 100);
  } else {
    await npix.setGlobal(0, 0, 0);
  }
}
``` -->

---

# Enjoy the IoT!

---

## ⚠ Raspberry Pi のカメラに関する注意事項

- 接続端子・フラットケーブルは壊れやすい
  - 引っ張らない
  - 折り曲げない

カメラ接続確認コマンド:

```
$ vcgencmd get_camera
supported=1 detected=1, libcamera interfaces=0
```

---

## ⚠ 片付け注意事項

借りた電子部品は返却しましょう

- Raspberry Pi Zero W
- USB ケーブル
- 各種貸し出しデバイス

(詳しくは会場のスタッフが案内します)

---

## ハッカソンに向けて

Slack にてお気軽にご相談お寄せください

今回のハンズオンをスタートとして、それぞれの目指す方向に合わせて技術習得を進めていって頂ければ幸いです

---

## 【参考】材料調達 Tips

> ネットショップ購入のリードタイムに注意。初動が重要。

https://gist.github.com/elie-j/8a27e7a65a40371e0cda5754ce0a063d

---

## 過去の資料

- [2023 年度 岡山版](/chirimen-hands-on/2023/okayama/)
- [2022 年度 東京版](/chirimen-hands-on/2022/tokyo/)
- [2022 年度 岡山版](/chirimen-hands-on/2022/okayama/)
- [2022 年度 愛媛版](/chirimen-hands-on/2022/ehime/)

---

## フィードバック

[このスライドを編集する](https://github.com/kou029w/chirimen-hands-on/edit/main/README.md) / [問題を報告する](https://github.com/kou029w/chirimen-hands-on/issues/new)

<script type="module">
document.querySelectorAll("a").forEach(function (a) {
  Object.assign(a, {
    target: "_blank",
    rel: "noreferrer",
  });
});
</script>
