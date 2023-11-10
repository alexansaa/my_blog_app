require 'rails_helper'

RSpec.describe Comment, type: :model do
  tmp_user = User.new(name: 'myUser', photo: 'link photo', bio: 'my desc', posts_counter: '0')
  tmp_user.save
  subject { tmp_user.posts.create(title: 'Post 1', text: 'the text', comments_counter: 0, likes_counter: 0) }

  after { subject.save }

  it 'updates comment counter verification' do
    subject.comments.create(user: tmp_user, text: 'some text')

    expect(subject.comments_counter).to eq(1)
  end
end
