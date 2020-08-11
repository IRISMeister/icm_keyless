(なにかと取得が面倒な)AWSアクセスキーなしでicmを実行する

最小構成でubuntuのvm起動
-O/S,インスタンスタイプとも、無料利用枠の対象で十分
-Role:iwamoto-EC2-Snapshots-roleを付与
(AmazonEC2FullAccessを持つRoleなら何でも良い)

git clone https://github.com/IRISMeister/icm_keyless.git
cd icm_keyless

getkits.shのexport内容を修正。

vi envs.sh  (cpfをminに)

$ ./runall.sh

$ ./run.sh

$ ./rm.sh MyIRISRAW


