require 'rails_helper'

RSpec.describe Comment, type: :model do
  tmpUser = User.new(name: 'myUser', photo: 'some link to the photo', bio: 'my bio description as a long text', posts_counter: '0')
  tmpUser.save
  subject { tmpUser.posts.create(title: 'Post 1', text: 'the text', comments_counter: 0, likes_counter: 0) }

  after { subject.save }

  it 'updates comment counter verification' do
    subject.comments.create(user: tmpUser, text: 'some text')

    expect(subject.comments_counter).to eq(1)
  end
end