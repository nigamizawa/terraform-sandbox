output "this" {
  value = {
    common = module.common.this
    hoge = module.hoge.this
  }
}
