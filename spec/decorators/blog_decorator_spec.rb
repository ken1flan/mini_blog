require 'rails_helper'

describe BlogDecorator do
  let(:blog) { Blog.new.extend BlogDecorator }
  subject { blog }
  it { should be_a Blog }
end
