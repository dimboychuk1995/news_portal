%w(Політика Фінанси Технології Світ Життя Спорт Інтерв'ю).each{ |name| Category.find_or_create_by(name: name) }

100.times { Article.create(title: FFaker::LoremUA.sentence,
                          content: (FFaker::LoremUA.paragraphs+FFaker::LoremUA.paragraphs).join('<br>'),
                          main_image: 'https://source.unsplash.com/random',
                          category: Category.all.sample,
                          updated_at: FFaker::Time.between(Time.now - 30.days, Time.now)) }