# ISUCON7
正社員用レポジトリ


# デプロイ方法

## 事前準備
* デプロイ先のインスタンスの中で `git pull origin branch` ができること
* デプロイ時に実行するコマンドを `$DEPLOY_DIR/deploy.sh` に定義しておくこと
* `ssh_key` ファイルの鍵で `SSH_USER` としてSSHログインできること

## CI で設定する環境変数

* `IPS`: '1.1.1.1,2.2.2.2,3.3.3.3'
  * `1.1.1.1`, `2.2.2.2`, `3.3.3.3` のサーバーにデプロイする

* `SSH_USER`: `hoge`
  * SSHするユーザ名

* `DEPLOY_DIR`: `~/`
  * `git pull origin branch_name` するディレクトリ。

* `DEPLOY_BRANCH`: `master`
  * デプロイするブランチ

## 注意事項
* `DEPLOY_BRANCH` とCIで実行しているブランチ名が同じ時のみデプロイされる。つまり`DEPLOY_BRANCH=master`のときには master ブランチにpushされたときのみデプロイ処理が走る

# SSH鍵でSSHできるようにする
```
$ cd ~/.ssh
$ vi authorized_keys
# isucon.pub を貼り付け
$ chmod 644 authorized_keys
```

# サーバ内でgit pullできるようにする

```
$ cd ~/.ssh

$ ssh-keygen -t rsa

$ ls
-rw-------  1 isucon isucon 1675 Oct 22 11:22 id_rsa
-rw-r--r--  1 isucon isucon  404 Oct 22 11:22 id_rsa.pub

$ cat id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyPAhWSVstcKd105effm+sS2SZ04QonDvk7wZ1fSD31F01OlZ1h5tyjE52bE1ET+EECtORBxa2t3toSdAUnhYNVcJFOy+n+Iq51v+AyoL43z6linCMx9T6g5+0wJk7w5M5xZ0eJ+YzSf3XnP6ahX/xR12u03WtuqLfYVIxkUwWJgPV0GmhDlAmEciuGSkdEX1RzZglx0lP0Y+ZnqONsugyHguA7kN7TfIfP3qkXT20VV4lHYl/U1SxR5Nq6rUKUYCrMER5Uo/MPw59fVu85udUJ5lAZEMusPHeiH15yIf/YEbW7X6sl2O85HPKbQwctrmmAAVwMVEh5H5Vy2FNOfTf ishocon@ip-172-31-15-1

$ cat id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAsjwIVklbLXCnddOXn35vrEtkmdOEKJw75O8GdX0g99RdNTpW
dYebcoxOdmxNRE/hBArTkQcWtrd7aEnQFJ4WDVXCRTsvp/iKudb/gMqC+N8+pYpw
jMfU+oOftMCZO8OTOcWdHifmM0n915z+moV/8UddrtN1rbqi32FSMZFMFiYD1dBp
oQ5QJhHIrhkpHRF9Uc2YJcdJT9GPmZ6jjbLoMh4LgO5De03yHz96pF09tFVeJR2J
f1NUsUeTauq1ClGAqzBEeVKPzD8OfX1bvObnVCeZQGRDLrDx3oh9eciH/2BG1u1+
rJdjvORzym0MHLa5pgAFcDFRIeR+VcthTTn03wIDAQABAoIBABjH8ADPQjYXK7Fe
Mf6i/bPe56XbmsxqrIkwEp3TP/o1NKBp9AtzR1Gt4Frmw/dzg72kI7ZOXgIZkLb3
TE8Ri89e1Rv7Fq0sCV29XtjxTzR7FaK+lNd+EUajdlkTTjrY/mdR6n5+3arT5s9L
rLqfRSKu4X+lNv9oq6yTQ3JQ2VtawlZcXU4R9zEQdvMWbk0esFs9DWZDbNkBq7jm
jV+iqKhSLDehv9X5AzQ16RCRJ2tW2P2Nuk0RRJnQ8Fcdwe3GyYs3omp1AoqvUSBB
QIqmr+pojxcI/FwXdvBrQOWfE6f5OQy8LdOtIF9CY5KNYQkUnYHz6IdbSgAnx5eE
3q4mMwECgYEA2Fa504DMYzj3JofNEOAkGnBBXJ1faeEjqv6HV47FCsb/ybLet4wl
26uVmmSe5Vd0F2PpMopWhXiPIQR2fuEDuWZy9ec5zpO/1vYzMv7nITdSjOoci+t7
fgoZnTzrfKZk3uW4sawsX7hGkUUvi2fpYIVCepSB1YGb/sMNB+AQb08CgYEA0uj8
aVSlkgnh/mzx7W8iDPgYsFBq7pdm9hCTaX13ojkkbDvMzuuJYAaf1qCNWSK3WYLB
8RAVQuK1A9FEiIxm+G8vjP6r1MiD1GwG7xgmIq6v68IpgLpyufUvroqhconXpAKX
LE2m6ZkaxWNGZG4RtuR3H458bLH9NhjMj0idPXECgYBNhj6PIV+cyuQeRZnhy0CE
zOdPRgHUEl7SvuVHJh1MMGWnJNcU1T8XyhQRQK+EJeOvIhmGB/bbW4mG3m+MJhxM
iv71Scf4VA/x+0X7p0ayK34Eizxxk5AsaXgmVZdZktMg4RdfbAB2yLVZB37zKOiD
sx1QiflAxnJdSA5aXRvmlwKBgDbKIbA3Nh/fA191688zfJQD6136Nh0vJacsnS7d
UjPJRmX7jvP+Chzw+5rk8HNEan8NUdaOyActH7sTJQuX9bP6Jk8pZXgMcvq+6Xo5
OsbtvHOxZ9iyFtWqFS3xg4let686oQz4SzEJ/gNjC8lRMrbhWPTQrhAKmO3xuUpL
odVxAoGAFbrOa/jXQVjvD9OHdRUaWEVdWqjXSTq51aBUVV6BQwkJMgPSl4+aK7mD
mM2tksPv1OS7QcfuneaDLy4B5IW3y0mpWYjAdPmIzjvDnue0svO3RWqfUybAiu5b
J/WB+1Vt/dO8Wcn9SXxbIs/dun7bmKtFsEfJgN1fxq/qZ7XTaGE=
-----END RSA PRIVATE KEY-----
# 鍵登録

$ ssh -T git@github.com  # 接続確認
```
