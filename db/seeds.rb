# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'hare@com',
  password: 'hareshoku'
  )

Member.create!(
  [
    {
      name: 'はるの(test_user)',
      profile: 'お汁粉や桜餅、お団子など甘いものが好きで、よく手作りします。',
      profile_image: open("./db/seeds_images/profile1.jpg"),
      email: 'test@com',
      password: '000000'
    },
    {
      name: 'ふうた',
      profile: '皆さんと一緒にたのしみたいです。',
      profile_image: open("./db/seeds_images/profile2.jpg"),
      email: 'futa@com',
      password: '111111'
    },
    {
      name: 'ちよ子',
      profile: '皆さんと一緒にたのしみたいです。',
      profile_image: open("./db/seeds_images/profile3.jpg"),
      email: 'chiyo@com',
      password: '222222'
    }
  ]
  )

Season.create!(
  [
    {name: '春'},
    {name: '夏'},
    {name: '秋'},
    {name: '冬'}
  ]
  )

Event.create!(
  [
    {
      season_id: 1,
      start_time: '2020-5-5',
      name: '端午の節句',
      food: '柏餅',
      introduction: '子供の日。柏の木は、、、、という意味があり、縁起の良い食べ物です。',
      event_image: File.open("./app/assets/images/slide3.png")
    },
    {
      season_id: 2,
      start_time: '2020-7-28',
      name: '土用の丑の日',
      food: 'うなぎ',
      introduction: 'うなぎを食べるようになったのは諸説あります。',
      event_image: File.open("./app/assets/images/about6.png")
    },
    {
      season_id: 3,
      start_time: '2020-10-1',
      name: '十五夜',
      food: '月見団子',
      introduction: '中秋の名月。五穀豊穣を感謝しお団子をお供えします。',
      event_image: File.open("./app/assets/images/about5.png")
    },
    {
      season_id: 3,
      start_time: '2020-10-29',
      name: '十三夜',
      food: '月見団子',
      introduction: '五穀豊穣を感謝しお団子をお供えします。',
      event_image: File.open("./app/assets/images/about5.png")
    },
    {
      season_id: 4,
      start_time: '2021-1-1',
      name: 'お正月',
      food: 'お節',
      introduction: '年の初めをお祝いするおせち料理。それぞれに意味が込められています。',
      event_image: File.open("./app/assets/images/about4.png")
    },
    {
      season_id: 4,
      start_time: '2021-1-7',
      name: '人日の節句',
      food: '七草粥',
      introduction: '七つの葉を入れたお粥は、無病息災と一年の豊作を願って食べます。',
      event_image: File.open("./app/assets/images/about2.png")
    }
  ]
  )

4.times do |n|
Post.create!(
  [
    {
      member_id: 1,
      event_id: 3,
      date: '2020-10-1',
      food: 'お月見だんご',
      content: '屋上で月を眺めながら手作り団子を食べました！とっても美味しかったです。',
      food_image: File.open("./app/assets/images/about5.png")
    },
    {
      member_id: 1,
      event_id: 2,
      date: '2020-7-28',
      food: 'うなぎの蒲焼',
      content: '美味しかったです！',
      food_image: File.open("./app/assets/images/about6.png")
    },
    {
      member_id: 3,
      event_id: 1,
      date: '2020-5-5',
      food: '柏餅',
      content: '今年はあんこを炊いて、柏餅を手作りしました',
      food_image: File.open("./app/assets/images/slide3.png")
    },
    {
      member_id: 2,
      event_id: 5,
      date: '2021-1-1',
      food: 'お節料理',
      content: '黒豆や野菜の煮物にはこだわりました！',
      food_image: File.open("./app/assets/images/about4.png")
    },
    {
      member_id: 3,
      event_id: 6,
      date: '2021-1-7',
      food: '七草粥',
      content: '今年はたくさん作りしました',
      food_image: File.open("./app/assets/images/about2.png")
    }
  ]
  )
end

Favorite.create!(
  [
    {
      member_id:2,
      post_id:1,
    },
    {
      member_id:3,
      post_id:1,
    },
    {
      member_id: 3,
      post_id: 2,
    },
    {
      member_id: 1,
      post_id: 3,
    },
    {
      member_id: 1,
      post_id: 4,
    }
  ]
  )

Comment.create!(
  [
    {
      member_id: 2,
      post_id: 1,
      comment: 'とっても美味しそうですね！！'
    },
    {
      member_id: 3,
      post_id: 1,
      comment: 'おいしさが伝わってきます。'
    },
    {
      member_id: 3,
      post_id: 2,
      comment: 'わたしも食べましたよ！'
    },
    {
      member_id: 1,
      post_id: 3,
      comment: 'わたしも作りましたよ〜！'
    },
    {
      member_id: 1,
      post_id: 4,
      comment: 'とっても美味しそうですね！！'
    }
  ]
  )

