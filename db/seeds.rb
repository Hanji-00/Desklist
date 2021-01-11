(1..30).each do |num|
    Desk.create(title: "title" + num.to_s, content: "desk " + num.to_s)
end