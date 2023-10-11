# sso sample module

## 処理の大まかな流れ

- `permission set`の作成
  - 以下で若干実装が異なる
    - 既にawsが用意している`managed policy`を元に作成(aws_ssoadmin_managed_policy_attachment)
    - 新たにpolicyを作成する`customer policy`を利用(aws_ssoadmin_customer_managed_policy_attachment)
- `group`情報の取得
  - 新規に作成する場合: `aws_identitystore_group`
  - 外部IdPなど既存情報を取得する場合: `data.aws_identitystore_group`
- `account`に対して`permisson set`と`group`を紐付ける

## 各種処理の詳細

### `permission set`の作成
wip

### `group`情報の取得
wip

### `account`に対して`permisson set`と`group`を紐付ける
1 `account`に対して、1`permisson set`と1`group`を紐付ける仕様となっている。そのため`permission set`や`group`が複数存在する場合、
ループ処理など実装を工夫しなければ冗長的なコードになり保守性が低下する懸念がある。
一方で、ネストしたループを繰り返すなど複雑な処理が増え過ぎる点についても保守性の低下を招く要因として考えらるためこれらを考慮した実装が必要だと考える。
