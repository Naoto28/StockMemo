# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Company.create(
  :text => '決算が良かった',
  :stock_code => 4502,
  :company_name => "武田薬品工業"
)

Company.create(
  :text => '決算が良かった',
  :stock_code => 4503,
  :company_name => "アステラス製薬"
)

Company.create(
  :text => '決算が良かった',
  :stock_code => 4559,
  :company_name => "ゼリア新薬工業"
)
