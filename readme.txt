AWSアクセスキーなしでicmを実行する

最小構成でubuntuのvm起動
-O/S,インスタンスタイプとも、無料利用枠の対象で十分
-VMにRole:(AmazonEC2FullAccessポリシーを持つRoleなら何でも良い)を付与。

$ git clone https://github.com/IRISMeister/icm_keyless.git
$ cd icm_keyless
$ vi runall.sh
(WRC_USERNAME='xxx' WRC_PASSWORD='xxx'　を修正)

iris.keyを~/に配置。 (s3? scp? copy&paste?)

$ ./runall.sh

$ vi envs.sh  (必要ならcpfをminに)
$ vi defaults/aws/ubuntu/defaults.json　　(mirrorならMIRROR:true,_Zoneをコメントイン)
$ sudo ./run.sh

$ sudo ./rm.sh MyIRISRAW

