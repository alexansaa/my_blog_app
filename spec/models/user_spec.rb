require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'myUser', photo: 'link photo', bio: 'my desc', posts_counter: '0') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be positive or zero, evaluate against nil' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be positive or zero, evaluate numerical negative value' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be positive or zero, evaluate against valid value' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end

  it 'returns the most recent posts' do
    post1 = subject.posts.create(title: 'Post 1', text: 'the text', comments_counter: 0, likes_counter: 0)
    post2 = subject.posts.create(title: 'Post 2', text: 'the text', comments_counter: 0, likes_counter: 0)
    post3 = subject.posts.create(title: 'Post 3', text: 'the text', comments_counter: 0, likes_counter: 0)

    most_recent_posts = subject.most_recent_post.to_a

    expect(most_recent_posts).to eq([post1, post2, post3])
  end

  it 'returns the 3 most recent posts, even if there are more' do
    post1 = subject.posts.create(title: 'Post 1', text: 'the text', comments_counter: 0, likes_counter: 0)
    post2 = subject.posts.create(title: 'Post 2', text: 'the text', comments_counter: 0, likes_counter: 0)
    post3 = subject.posts.create(title: 'Post 3', text: 'the text', comments_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 4', text: 'the text', comments_counter: 0, likes_counter: 0)
    subject.posts.create(title: 'Post 5', text: 'the text', comments_counter: 0, likes_counter: 0)

    most_recent_posts = subject.most_recent_post.to_a

    expect(most_recent_posts).to eq([post1, post2, post3])
  end
end
