require 'rails_helper'

RSpec.describe Like, type: :model do
  tmpUser = User.new(name: 'myUser', photo: 'some link to the photo', bio: 'my bio description as a long text', posts_counter: '0')
  tmpUser.save
  subject { tmpUser.posts.create(title: 'Post 1', text: 'the text', comments_counter: 0, likes_counter: 0) }

  after { subject.save }

  it 'updates likes counter verification' do
    subject.likes.create(user: tmpUser)

    expect(subject.likes_counter).to eq(1)
  end
end