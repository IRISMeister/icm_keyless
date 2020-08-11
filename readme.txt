(なにかと取得が面倒な)AWSアクセスキーなしでicmを実行する

最小構成でubuntuのvm起動
-無償対象枠で十分
-Role:iwamoto-EC2-Snapshots-roleを付与
(AmazonEC2FullAccessを持つRoleなら何でも良い)

$ git clone https://github.com/IRISMeister/icm_keyless.git

getkits.shのexport内容を修正。
iris.keyを./に配置。
vi envs.sh  (cpfをminに)

$ ./runall.sh


