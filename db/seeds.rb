User.create!(name:  "ユーザワン",
               self_introduction: "名乗るほどのものではございません。",
               genre: "漫才",
               career: "1年以下",
               gender: "男",
               country: "日本",
               age: "20代",
               organization: "フリー",
               email: "hugusanma@gmail.com",
               area: "関東",
               password:              "aaaaaa",
               password_confirmation: "aaaaaa",
               confirmed_at: Time.now
               )

99.times do |n|
  name = Faker::Japanese::Name.name
  self_introduction = ["お笑いが大好きです。よろしくおねがいします。","相方探してます。よろしくおねがいします！","一緒に天下取りましょう！","お笑いに人生かけてます。","ピン芸人でしたが寂しいのでコンビ組みたいです。","トリオ組みたい人いませんか"].sample
  area =["北海道", "東北","関東","北陸","東海", "近畿", "中国", "四国","九州", "沖縄"].sample
  genre =["漫才","コント","その他"].sample
  age = ["10代","20代","30代","40代", "50代","60代以上"].sample
  gender = ["男","女", "その他"].sample
  career = ["1年以下","2年","3年","4年","5年以上"].sample
  country = ["日本","海外"].sample
  organization = ["フリー","吉本","松竹","人力車","マセキ","ワタナベ","ホリプロコム","その他"].sample
  email = "example-#{n+1}@waraii.org"
  password = "aaaaaa"
  
  
  User.create!(name:  name,
               self_introduction: self_introduction,
               genre: genre,
               career: career,
               gender: gender,
               country: country,
               age: age,
               organization: organization,
               email: email,
               area: area,
               password:              password,
               password_confirmation: password,
               confirmed_at: Time.now
               )
end