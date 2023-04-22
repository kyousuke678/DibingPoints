# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'admin@admin', password: '123456')

Tag.create([
    { category: 'Fish' },
    { category: 'terrain' },
    { category: 'Night'},
    ])

# 一括で10個のユーザーデータを作成
10.times do |n|
  customer = Customer.create!(
    name: "テストユーザー#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: "testhoge",
    introduction: "test"
  )
  file_path = Rails.root.join('app/assets/images/' + "test#{n + 1}.jpg")
  customer.profile_image.attach(io: File.open(file_path), filename: "test#{n + 1}.jpg", content_type: 'image/jpeg')
end

Point.create!(
  [
    {
      customer_id: 1,
      name: "伊藤 新井の浜",
      body: '地形が最高',
      tag_ids: "2",
      rate: "4",
      lat: "34.971138200851094",
      lng: "139.10686572661132"
    },
    {
      customer_id: 1,
      name: "伊藤 満根",
      body: '地形が最高',
      tag_ids: "2",
      rate: "4",
      lat: "34.971138200851094",
      lng: "139.10686572661132"
    },
    {
      customer_id: 4,
      name: "明石前ビーチ",
      body: '少し物足りない',
      tag_ids: "1",
      rate: "2",
      lat: "35.9224712",
      lng: "135.9974704"
    },
  ]
)