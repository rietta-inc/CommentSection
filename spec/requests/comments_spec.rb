require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /comments" do
    it "works! (now write some real specs)" do
      get comments_path
      expect(response).to have_http_status(200)
    end
  end

  it 'should not show a XSS / script payload in a comment' do
    xss_comment = Comment.create(
      author: "George Burdell",
      body: "<script>console.log(\"I'm an evil hackerman\");</script>"
    )
    get comment_path(xss_comment)
    expect(response).to have_http_status :ok
    expect(response.body).to_not include '<script>'
  end
end
