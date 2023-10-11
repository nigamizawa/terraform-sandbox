# 外部IdPを利用する場合、以下の実装を再検討する。(dataとかで取ってこれるかも)
locals {
  groups = {
    Admin = {
      name              = "admin"
      mailing_list_name = "admin"
      description       = "管理者"
    }
    Dev = {
      name              = "dev"
      mailing_list_name = "dev"
      description       = "開発チーム"
    },
    Sre = {
      name              = "sre"
      mailing_list_name = "sre"
      description       = "SREチーム"
    }
    Guest = {
      name              = "guest"
      mailing_list_name = "guest"
      description       = "一時的にaws触る人たち"
    }
  }
}
