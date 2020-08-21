AWSアクセスキーなしでicmを実行する

最小構成でubuntuのvm起動
-O/S,インスタンスタイプとも、無料利用枠の対象で十分
-インスタンスにRole:(AmazonEC2FullAccessポリシーを持つRoleなら何でも良い)を付与。

$ git clone https://github.com/IRISMeister/icm_keyless.git
iris.keyを~/に配置。 (s3? scp? copy&paste? whatever)

$ WRC_USERNAME='xxx' WRC_PASSWORD='xxx' kit='IRIS-2020.1.0.215.0-lnxubuntux64.tar.gz' icmkit='icm-2020.1.0.215.0-docker.tar.gz' ./icm_keyless/runall.sh

この時点で、下記を実行できるはず。
$ aws ec2 describe-instances
出来なければ、おそらくIAM Role設定が不測しているので、先に対処すること。（しないと、以後の処理は失敗する）


$ vi params.sh  (必要ならcpfをminに)
$ vi defaults/aws/ubuntu/defaults.json　　(mirrorならMIRROR:true,_Zoneをコメントイン)
再ログイン後であれば
$ ./run.sh
そうでなければ
$ sudo -u $USER ./run.sh

$ sudo ./rm.sh MyIRISRAW

