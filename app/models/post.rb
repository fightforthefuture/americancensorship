# -*- coding: utf-8 -*-
class Post < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  
  validates_presence_of :post, :email, :name

  def censored_post
    self.post.gsub(/\w{4,}/) do |match|
      "█" * match.length
    end
  end
  
  def to_tweet
    truncate(censored_post, :length => 100) + ' ' + short_url
  end
  
  def short_url
    'http://americancensorship.org/posts/' + id.to_s + 'uncensor'
  end
  
end
