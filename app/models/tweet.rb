class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true

  def mentions
    mentions = self.content.scan(/(?<!\w)@(\w+)[\W$]/).flatten!
    if mentions
      mentions.each do |mention|
        user = User.find_by(handle: mention)
        if user && user != self.user
          user.send_mention_email(self)
        end
      end
    end
  end
end
