# Create initial data only for a single environment.
if Rails.env.development?
  n = 100

  (1..n).each do |i|
    Model1.create string_col: "t#{i}"
    print '.'
  end

  model1_ids = Model1.all.map {|m| m.id}

  (1..n).each do |i|
    Model0.create string_col: "s#{i}",
      integer_col: i,
      model1_id: i
    print '.'
  end

  (1..n).each do |i|
    newuser = User.new email: "u#{i}@mail.com",
      password: 'a',
      name: "U#{i}"
    newuser.skip_confirmation!
    newuser.save!
    print '.'
  end

  Model3.create!(string_col: 's1', integer_col: 1)
end

UploadTotal.create id: 1, upload_total: 0
