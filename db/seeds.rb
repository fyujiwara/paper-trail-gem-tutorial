@article = Article.create(title: "Version 1", body: Faker::Lorem.paragraph)
2.upto(6) do |i|
  @article = Article.update(title: "Version #{i}")
end

1.upto(2) do |i|
  @deleted_article = Article.create(title: "Deleted Article #{i} Version 1", body: Faker::Lorem.paragraph)
  @deleted_article.destroy
  @deleted_article = Article.new(id: @deleted_article.id).versions.last.reify
  @deleted_article.save
  @deleted_article.update(title: "Deleted Article #{i} Version 2")
  @deleted_article.destroy
end

@restored_article = Article.create(title: "A Previously Deleted Article", body: Faker::Lorem.paragraph)
@restored_article.destroy
@restored_article = Article.new(id: @restored_article.id).versions.last.reify
@restored_article.save
