class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true

  def mentions
    mentions = self.content.scan(/[\W\A]@(\w+)[\W$]/).flatten!
    mentions.each do |mention|
      user = User.find_by(handle: mention)
      if user && user != self.user
        user.send_mention_email(self)
      end
    end
  end
end
